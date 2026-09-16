Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C04F30FA
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565918; cv=none; b=hxBONud3siKlvzK/CyOmNW8DDYOARh4BbFhYtMTeZmVReEVwWMc9685tx/aDn8pNCxVaUDsrHJ34+zEvoL7EIqNRY/VrnLkXQAqMvffUGCofQsJTe+KEZrnfCRT7gzR+4Trjqwp2RMab7xsDfm2cI+fRPHl6iskxcUZR1R1LBVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565918; c=relaxed/simple;
	bh=gr8uD9XWy7EPGvPIwLrmL5ImB5sWtzac4sXA0IvvQd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8ZtZ6P6eVaFwM8g9P67gSjivE+Vvp0n46ZdbYHAOE6vKzKBoPhuSylAOT2MPH8YfT/uoN0u8hBqyj2lFcY4tscS4XXK84vNmGIK+MaY4caDK6fKJT9hKV5QacrcAvCXO9FT6bdlzQ7e/o/7RUW/dnxYsLBqiEREI3G/JE03B7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8kSfjgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY6GmmXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8kSfjgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY6GmmXl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYqh42947126
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LlhMlNHGEpK0T30X/QJXpo30
	EE7ZsUpq2JBHpDtamuk=; b=F8kSfjgkXsDY12jEah2EiaQ98LB4kaRz6Sw5gUOD
	dS3eDgCRFh2ZAlTRJWcgy48XpX9PzIAhjSO7vthSxzPJPWWNFJpzhJp8tEPrxA4h
	u873Ci8ACv7nlOsU/Dxof+ezLjEs6cWrJdbScBHKoIJkOJCit5ih2E1IKCc9RsrW
	8tqiyc37ynjhH2V2nkDN0x8QKoLp16aB5CpbzEz3vMKQcbtKTOSim68smku3mpnf
	Jr2fiDpHVMAZpKyHzvxkPJJzWnXzIRWTLBjtOnE1HQSOL0ConSZU6fnNXNekqQie
	DQXtDrzY/AfZkQ3j7P/oIsPs9mGOpByYOlSBYjOiyMn6sw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcktm90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:38:12 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8076c66efc6so5767645a34.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565892; x=1790170692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlhMlNHGEpK0T30X/QJXpo30EE7ZsUpq2JBHpDtamuk=;
        b=TY6GmmXl6/ib8uv3Ot3V+A7hpe1nV7WaAjtJh2DTJgi+RvnaWH0WhXbxGQs2/W25tl
         JzL5jE66B1YNrLST1a6g6M7+xRV/1yeZlrRAViRCGHhqlFNsvy7kqRvcPvBNkb6o+BWi
         3HFnmhYSDZuHra6x94y3aeuI9B7Xwq6SSeOXIR7ijIfJ6yKSEKTcgGvyFUG+w3Yp+i0L
         ymn3xLJ74biNk9FMxfqL3BchmeYt88DEEtNospknxEGb2o/3H80/5Nqyb8OlivHhGT6e
         aMn7GmH71Lp04Ya8zDGlEipejxR453DfOAR2COsqbEbNI6r6Yd+87NUzBnlULQs/yRnV
         UAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565892; x=1790170692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlhMlNHGEpK0T30X/QJXpo30EE7ZsUpq2JBHpDtamuk=;
        b=mrjn1M/OJQ7rTqvYtrGGgAcIkBRRgJLUO/bE04UHBbKU61RshAVWO64DS8AemrwUO2
         50LDdszhE9bpgo0fFZ5m3eAJqJcMLG2NqL78BGSAIdJnbYoB/W1utEkeXfj7MirX909+
         A3N1rvY7hwWplHEFmGS/8ltlvJMKPoK7B2+Mqw96WB+qN9hiSCYpSYGGg3H67RmUSIIf
         DQo5rcklPwKIEopuk9doJY3Pj4VidCTqG47VPLbUX4IuWhm4eTi9vukPoi3Hc2fx9j62
         i/53BpGBO6l+zlTImDGlHGPdpeSR3GZyvm8ZyQ7Z9ywIEmMFVU+3SkKIMVmLSS4++C4S
         VGtA==
X-Forwarded-Encrypted: i=1; AKwUvBxOFeuYEIC26gStlFCgM8+nhlnbItBiUCL4vQhkOFMSLQAIqTc79FrX8vlwzGYPleX9/QTLzY2hQpJ0@vger.kernel.org
X-Gm-Message-State: AFuF++kbnEeN/QeBbpeaMazp3UzlCWN0DFOhmEu28eLjKx+8BQaH4HlU
	qSN4p78WFF7GKolnNz3G4dtX8wrSzyisDT6/6PZr8tAn/3uMCjMs7PLWclBqrBNUlLvmFJsfHun
	t7YO6cCsLikEY6tOvw0UHvh0jPVbFHP69rbme2FG+/PLXkFwBPKkDdc3GeEVN5zr9
X-Gm-Gg: AYBFou0UQKB7YFqv2Anf/83KFV/gyfbqSb8ty30cVIPBXFE+AEZMJnyaGbhQVA7pson
	FzghdUUoUg9uRZU+rExPFF/fdggG+gCPLLtvimAoii2muKKRevaBMYTV1B5Qc9ClYz8PNYs0mif
	uznJTYFfZHm74Dgo3iDSTHRjkIm76CA0jz1EpT7Fd3375zH3Gt3e34ryu2u21yeoHgek+YBKRAy
	RIXW6r1zU4HtgcsMadcKFiIKJCj6Ga7YYLrZNg475rvm3HoJQxfky9p0Z58uwEgLuOn3NDkoS4k
	ZCVHV/lMRKH+eHMyfKN1Hi7PLJjiuhCj2DqVTcWvmWJJ6k35umhsHablwFMZIJnAv5IsmaU3H2U
	xe5yyIcDblEWuhYr9BarNZ0bHnQPvr/pWakFWXi5MOA0=
X-Received: by 2002:a05:6830:410c:b0:7f4:effa:a5ad with SMTP id 46e09a7af769-80b2ec5aac4mr4800112a34.10.1789565891925;
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
X-Received: by 2002:a05:6830:410c:b0:7f4:effa:a5ad with SMTP id 46e09a7af769-80b2ec5aac4mr4800069a34.10.1789565891485;
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0302sm2541841a34.25.2026.09.16.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:38:04 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 RESEND 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <aqqbvEH0U6LYR8UR@QCOM-aGQu4IUr3Y>
References: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
 <20260911073414.16711-3-shengchao.guo@oss.qualcomm.com>
 <aqfyPQ8bxxvBEB_3@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqfyPQ8bxxvBEB_3@black.igk.intel.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfX9nYDvMCvzky/
 aB4bnh6jiUzGvycfa0zce9iQMwU28qFvpJIkTAkm9udADJTl1mcWnRkpPfckiJyOAOJuTZlhOE7
 NTts3f8wMADpvgnIojaKdrrERYAj1EQ=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa9bc4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8alAasM9Vt_m-_31djgA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: Zb37BePkV6VycmXIiLA5qyzm6Yc91hPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfX1k3AqlaXWUGC
 8EUmrztc4zY17Lx7IfYoNCG6ofKNHHzLDVH+FQGLe960oS1m8FKRwL4f5m00SNASDl4s0vWCl5a
 qvnNN0R3fgX4RDxrXrYKssupWNZLRgzOuzgsxt/11xXFCgrBFyKhCxmC8bg/LWGCwAJh7VJV59N
 ZbDjFQ51OOqQK32yWTAu/h8N//WuLqTnGUY1xnw4PQJcE7PF7S2QKon1nWK6YqB08Khdk7er1kU
 aOZfTYj0vEOXTl8S40gI7KpvTnjfPTxpyu1YjxSu/rVnE7uOMOQv4DTOeCWdZbzwA5F57ryHiKN
 BElrPyy3IDf/EKZt66xVwcGXuDkY3jtySNqmBPZuNWmK7S7S23Wo3WIqShhVnGFQSiYOqyUoVA4
 54LBsLhaGXCk44phmJGoEdtv1Zs69XGQ8oAjCHoOflN4JFrAGy1NqjmEBmJfaDdoeWM+CnIhDon
 WVF+RKJoOBLBVtUOw3A==
X-Proofpoint-GUID: Zb37BePkV6VycmXIiLA5qyzm6Yc91hPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160182

On Mon, Sep 14, 2026 at 03:10:21PM +0200, Heikki Krogerus wrote:
> On Fri, Sep 11, 2026 at 03:34:14PM +0800, Shawn Guo wrote:
> > The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
> > which runs the Type-C state machine and the PD policy engine on an
> > integrated microcontroller. The host only observes the resulting state
> > and may ask for role swaps, so this is a plain Type-C class driver
> > rather than a TCPC driven by the Type-C Port Manager.
> > 
> > Register a Type-C port for each connector described in firmware, report
> > attach and detach, orientation, power and data roles and the PD
> > capability of the partner, and drive the USB role switch of the attached
> > USB controller so that OTG role switching works. Data and power role
> > swaps requested through sysfs are forwarded to the controller, which
> > performs them asynchronously and reports the outcome as a port status
> > interrupt.
> > 
> > The controller exposes a per-port VBUS ADC reading, but the Type-C class
> > has no VBUS attribute and nothing needs the value, so it is not read.
> > PD messages, PDOs and alternate modes are not exposed by the hardware at
> > all. The chip-wide MASTER_RESET command would drop both ports at once
> > and has no caller, so it is left alone as well.
> > 
> > Assisted-by: LLM
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> You changed the commit message, and that counts too. This is v3.

The resend only removes a Link tag. I did not know that removal/addition
of tags in commit log counts too.

> A
> few nitpicks below.

I will change those as suggested.

Thanks for reviewing, Heikki!

Shawn
