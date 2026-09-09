Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC32D73B8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 01:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917934; cv=none; b=cB49xt2V4eSXR/mfF/lHbF3wEx/YCy49CaEln6JqJKqKsguG3KS+AsGOxoSpO3SZsQMxxQpKfnQQfKSlTrdGrSN+igr5yOFJ4sm3VlAPd/VlVBUWBecx0VWzC7cWSTKx9tZYnZuJaMeKqTXU841of6DkcRpK5IrPdd/Jd1aAGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917934; c=relaxed/simple;
	bh=gUemplhRSJAJzKCTLJsrmo/7lPnTZM3iiNRs9Xdx/h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZm1lcnu/X8Vt/xI2ACr/joBV7ZjRDhW5nS9y6QuKxbfivFkDK4aEYJhXT8ZG8xWWEOvaMNmnC4BZVA2lqgbPe7MWSQ6CPACRHGY9IdVV2RLxX/dsmgNV+Q9Mvt/vLaaqWrR7d+8TBsa1txc/uyGKXGBAdzE6drgQIaxQvFX5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4RInRbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPEgJjqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4RInRbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPEgJjqW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgbdS3697399
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 01:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12hVyvMp5VWwWi9UH2JEM1r68VsvC3lqeQsWrxP240E=; b=b4RInRbx1BBew7/g
	B6orKYvjqSpnL16u5jIetYkLxy5mHBzlIguNwVuC9yO+aB90XM6XR9OVq6za9XEV
	3wcpCh5HsIMYqz7kFxboCyz1Yu/xa8kgPxZuY/Xs1BLw8mPyWyWYDQhV/qU5w66k
	4B0p3cv+nY/m3mojS3n7hs3NRRF9NVKuCCR2SuxvZv54EgUaDz3SgqOt9P3yGqRu
	hSpVpXgroSlqhIgxRXlRAEp/XIpg/6ew171QpwtrktF39WrhOC86dHNSQs6q2koi
	gky/BS8CGYXb8bV6LXetk1iSBjBrbFf5kKA1vfKc0zhvFIrDYmamkgUjc4dsyuTD
	PA5B5Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvuk2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:38:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so7184357a12.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788917931; x=1789522731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=12hVyvMp5VWwWi9UH2JEM1r68VsvC3lqeQsWrxP240E=;
        b=WPEgJjqWPi1dPXkJZqGWfb+F6+Q681TcLQez+zid1915bs+3BQNbewFh0iaUGwwEg/
         qvpMBtkbO86FY7sBeSsoCWYY7LhwtPTiU1Y17OXdC9KffGf0CRsKoZDjv0bHjELXPCst
         IsuMWTzrEueSX/DvZQgnOIPhOIku+VAoJIwNQq4AJUvsitdbBA0v05O8/S9hY46au8Fy
         2ckjgZdKRlfkGqZyTHRzIJmMqHNRg7bRyfGwiq62pE+RAGiLt5Rq8Ndu7+Jtx2meNq/p
         eIvoNAHSc1xEHFq3mvFDET32WRtfmiVnCLrtsaiP+PGSfrzSNz0zwD/vTyzaoAxb0/Th
         fD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788917931; x=1789522731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=12hVyvMp5VWwWi9UH2JEM1r68VsvC3lqeQsWrxP240E=;
        b=ZFCDXr70aNtYQCHPco/eFhlnujoAZeHW/pfDH075TWbZg1Rt+KqCsfQatfYXPGth0j
         ZPOLCOYaxLDN63wuHViZB+LtDyAYHAKNk/SXQt2hkze7pWRJdnBvRe/dls+S27M9lfI+
         zJNaEFk65DTcE12fsaEFy1P84JlVdzypjfV/ADaII9s2q0db7ALJmgmhJp/1mleEyRxz
         MG8nR0dsccuia0fHGctFnBjSNOMXeaQIN2VmdXu73SnVDoOE4UhqT7MGAb7AHOjJYq4f
         Rch01hVGdI7vdtIj6WU+3D7+qS/Nm9/Jz2NjFcu9Z8h7LA6sL+e7aL4InmVAGnjBNpW3
         mGqw==
X-Forwarded-Encrypted: i=1; AKwUvByB3NObKDXodwLEVI46YiWfAyH4HCjS4XrHMzWrTY3DJ4uJZJg5QZ3WLr3v2jeY+soVztxOjjhEjH4p@vger.kernel.org
X-Gm-Message-State: AFuF++lY6MDYmcpOvg6Hu4vwTErJLsbo95Artxonaf4VFQbN1VcgCfiT
	A0YNHPiCIHldKnDDL8QCNgwy9e5jEWKQHROqxl8lxWYTQUVtPcWkS3YTXTctD/6N+Aa9bYemj9z
	8zXo7RtAHMxRAmmwUdFmMqqcLW3QolZWhX8lAn8ZxtgtWa5jlrp77S5l86lMXW9J0
X-Gm-Gg: AYBFou0dczd1B2rMK1ppaYowQUa/D9/LY3CHso9yp7Jv8VWNWo0bk3c078uU2b9KiNp
	hzR2Ak8Fp/3GXA5lr4EWnsRAK2i5V1EY5LrtjG/t3uA3IMXQDoMrsD3Olt69FELGHokMKa+D8bd
	ksS5bhC21fSVpVZvnk2mmmMdFLQFsTHXI/gE67jkJ32ijt0smSzqbDrFmqA+iQQeiBnOd0VzMIC
	z8uWcTP6pIlj3nNu+pa/zBrYtnS//dUAUEbZeJwi6t5z1DsRYW/EmNgtY2GJ0968ByrZX5+nidf
	eepwoXiBlU+LgX4z4dZz+/u96Okx3NEoLNrA6CWDD0VT/CvVEVXWsxIAPwemTulfZ09uvnCmgG3
	6nuSksHxvCz3UZbpwZLpynUxR4lQthKGYoJpk+fp5lpc=
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr43588071a91.8.1788917931264;
        Tue, 08 Sep 2026 18:38:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr43588010a91.8.1788917930810;
        Tue, 08 Sep 2026 18:38:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm35410573c88.0.2026.09.08.18.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:38:50 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:38:43 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <aqC4oyV4WUdGynv-@QCOM-aGQu4IUr3Y>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
 <ap51p16bSY1Ru9C1@monoceros>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ap51p16bSY1Ru9C1@monoceros>
X-Proofpoint-GUID: Jhsw2RDESJ10ce2Qwgn2C19Je_QSw5QT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAxNiBTYWx0ZWRfXwoQWeO5xy3Bk
 hIZHHWn44qNlK5Fg/OVTQzRVObywb7wN0YJUxu0IhFmLbflz4pKZxGO2r0DML4hQjynr2/EIL9l
 +mVYBM+WcztfHkiPHO+V8+1v2uxjo4axc6Qdhh7GGz/ytRK8QQHMB3y25Xc8xpZAf8f+ZMicRET
 kGskD3LUJOS2liblsci27rKDoJXFLh1CeQG/CxqCPcb71MdOxQzpdUGZk9lZcEWQ/maF5wMqUnx
 q2tM0IVJVi4dfgtq75tT95IQoULxNlQ4pO7t9D5O8taVqZ3dWhN9GiGhP5NM2wdJ71+UeHmorqd
 sg4v0AluvnU3rqkw28R9SFX0mP7uop106M+gBEoyo6FByXO38EQuwV+i9OPB3xBt7X3peDjmZQW
 1SGSEpymcmuxp7sKhe/iJw2E1SUzb4fe1wH9e/Hd9gdP5NpoUTbsViVbRaVG9xqBu+g4rx7yEQS
 xPKZWze5cAoMwok236g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAxNiBTYWx0ZWRfX0+KlTZ4TvUeg
 M0LAsJiRUcLwmi4eoB20QB6cJcIGylERtxpTt0aGB8h0gTNoKXtgtAgpP2FtpzpefOI66zBpGgN
 MhGpLHYJ6LbmBDSRX5xKWukEGU5EHlE=
X-Proofpoint-ORIG-GUID: Jhsw2RDESJ10ce2Qwgn2C19Je_QSw5QT
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa0b8ac cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gj5R-QuDH20YKR02NA4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090016

Hi Uwe,

On Mon, Sep 07, 2026 at 10:32:55AM +0200, Uwe Kleine-König wrote:
> Hello Shawn,
> 
> On Wed, Sep 02, 2026 at 12:59:38PM +0800, Shawn Guo wrote:
> > +#include <linux/i2c.h>
> > [...]
> > +#include <linux/mod_devicetable.h>
> 
> Please rely on <linux/i2c.h> to provide of_device_id and (see below)
> i2c_device_id. Alternatively include the needed files below
> include/linux/device-id/ to not introduce unneeded dependencies.

Ah, yes! I will drop this include.

> 
> > +static const struct of_device_id fusb15201_of_match[] = {
> > +	{ .compatible = "onnn,fusb15201" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, fusb15201_of_match);
> > +
> > +static struct i2c_driver fusb15201_driver = {
> > +	.driver = {
> > +		.name = "fusb15201",
> > +		.of_match_table = fusb15201_of_match,
> > +	},
> > +	.probe = fusb15201_probe,
> 
> Don't you need an i2c_device_id table, too?

I'm not sure. For the DT case the of_match_table handles both matching
and module autoloading, so nothing is missing there.

The i2c_device_id table would only matter for a client created without a
fwnode, e.g. from board code, and that is not a case the driver supports
or has been tested against. probe() walks the child fwnodes of the device
to find the connectors and fails with -ENODEV when there are none, and
each port needs its Type-C capabilities and a usb-role-switch reference
from firmware. So matching by name alone would only turn a "no driver"
case into a probe failure.  If a platform without DT ever needs this
driver, it has to describe the connectors first, and the i2c_device_id
table can come along with that.

Shawn
