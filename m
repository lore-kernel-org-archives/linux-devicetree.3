Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4F342C98
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278003; cv=none; b=L4FsGROaH4WrpHxFaHE+unH/ZJt+/TcM3n8EAqEou5BckQ3yDQwnOGrmR9g7jxLgoZmqALFFb4wV8g/zCEvsjmzX0izli8sYw/e/5azpCE/FN4dqfBFcqUsdDgzWx16OzqNNjp5zJM7x/1e/DNDXMD/rnXxZd3m1ECyj8WALKtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278003; c=relaxed/simple;
	bh=2Q9Ncwhw0z00w1t4ETnApQ0wQK+b97/w0a9v4ZKSgBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTlvatcoMW5lk0MSkZrng9RolBIEjv+YUGixfKikzvrR3uCvz0FyhohWGofpjiG14DMWHCo3X49VYD18JvnVscq9yihgNcrwEvgIeeRbrNNBdRXUe0b5GNXEobeRanPIdnl5Z4lMVkj4Td9DndfkI/ETpnhzw94aBHCSfwD3Qw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIgaacv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahWdOycY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIgaacv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahWdOycY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cbDW980003
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oXe3C4b9BecGe6h9sGRxybc0
	wMYhUTY5ri4dAfoe7gI=; b=UIgaacv82rId6u5srug1sCraCNyMM0VIOLO0B4pg
	omX+2c22DoKrEuU/lrsbpAM9QISVUiOrRJFEgxDufaJ8g+rC09GG+U0LFRsVdZOH
	wQSguNizZB90uFSJHqVdKQccXY+BdlBJzx4gdhyWFVZR9M74LVdVcpjihTVkVzbA
	kOMucg2iCxJenNEeUInoQzQxQm1Jm6hJIwjXxrVKm+owmLTMWL5DmvZ1e4/8mEd2
	qc3T8x7BfY16BcvGZ8Ma+xAbcaFaP7sxUfwMCrR3AXNy31/ZQF9PhrbkU6NU3tOk
	R4TEpLvX7leBddypYy5DWu0zKDt/KIOVy/aQgpeDdrfRRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grfxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:46:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1959690a91.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277999; x=1784882799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oXe3C4b9BecGe6h9sGRxybc0wMYhUTY5ri4dAfoe7gI=;
        b=ahWdOycYJpW1uWK2WEpkfoi/SdmHbZ9m8HDZuynzt6Lv8V2mw42hgnOnKpFVF+91XJ
         F1eaVTksZbIc7CJJY227hV+hNpPuo86RF7+Y9rwntlk5VimLKENu7cAaX5xFieYYYjs4
         BX0cidZo0XA8ePk/qJZmUadHhakdKzcjPDoaqXurFmco0XJFMyOdDKy3aNSa5fGRx4DB
         Zv5e7ZnyBKye65QJwslLuDqrsd48REzjqm6tEzoDChUGMx9ZYHSDIqHpEVGGEquzrpSH
         wY6gasLR2ET+14fAlIRVsaCuKZVjO2KM3TvTc8AfVcNkiLIMjE8NawxPhr2dWOxlE7u2
         sOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277999; x=1784882799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXe3C4b9BecGe6h9sGRxybc0wMYhUTY5ri4dAfoe7gI=;
        b=nEaHDORs5YYtFm9MMeZx1v8huSSmaFWBSVaVcOmv2HMG2/NwMtjTNpZoAmhGrWv/Ui
         49yEFGeJ+4QN/40kzHu8LVfot5h1cxMax6toa5arsHufpDnOnA3i55PUc7PiiZMC/W2Q
         uqo77qYw8GiE92qrBbOhpznu/9SOcuPdhlacLNym1p2NNYeUGAkfl+ooVHJD2muGwiVc
         65tYlvav4XlbuowSGr1rUk1kjzcYwtmEyC/9wjB7dStYUGBqxaVFWwuVonn/mFxhrzsm
         0RIXIcsfOxEuhws7fsY0x1Bg/DhRVEnoQaLIC2LGHr6l602nhXPzZiaFEgj3pxxKfkgW
         9qQg==
X-Forwarded-Encrypted: i=1; AHgh+RrGSdacFb+4FufV3xThhjGvFX/bbDOyL61gTIMTi8xcmnmsYu0/iTRjCvA8nhCag+HlkWV4DxYrQhI7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsb2lkCFWR67iQWe8F6HhlpSG2ShOvnKWEuLtZ9J5aWvLngioV
	+bm3PbMX81H0KfcfmLqW92T7KTokS/CC51mrcY5vLA90sMoLByXf9Mp06Vx+5se5tvOPRf2khJH
	a2S7OKzDOIWDetnTdLRrT/54S7TAogJevk8Q8z3cltFZSEjLl2fY2kncR9fy03S8tHXl2txTY
X-Gm-Gg: AfdE7cmCodtITb2zMnSrZCRtqabgrdOEYDKEsdNzO/rxx2uvZBDa9eJ45xBq0/AXxJP
	BodTzOEeNcU7NZkiP6lnHgvgqGkSVzIRkwBBk0Nz+k0lJtgYhun2JHcwiJ7CGGGcR15QH6mpnjX
	CRz/sIQRwJebWs3e+0C6Q4Jh/c5N5Di91RSwujuR8tgRFv4QPdNVpWdX/mLSAlNGCBhBaO0RJcn
	IVf/auwJQpfeMEjbHDMUnuM1ISM7fxfnQlfeRcKl6s3FDG5BgGL69yli8nb9jwwOAEejFzzXpRS
	FIf0ad90DlHZN5vzKVfINYEe2HP2e6t33sJWoc/ag+9I+1seixXsqi3lPzdgO5h04DOuajA/XGA
	nhtgzPQE/+k+6ijVv6CbanrBr/Erart75gd1DklhSmSHmkc284g==
X-Received: by 2002:a17:90b:3907:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38e3d175d1emr6357986a91.6.1784277999416;
        Fri, 17 Jul 2026 01:46:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3907:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38e3d175d1emr6357963a91.6.1784277998919;
        Fri, 17 Jul 2026 01:46:38 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm5778034eec.5.2026.07.17.01.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:46:38 -0700 (PDT)
Date: Fri, 17 Jul 2026 01:46:36 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <alnr7DqzH81DRBFd@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <fe8f8696-d78c-4b80-8fb5-3978178533b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe8f8696-d78c-4b80-8fb5-3978178533b7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX2F2Eftiw9FDg
 zgEFTTLHiKSNwOBkqK3W19k8CuSe8GRNWdXXdeekC8QGM9VIBPei2io1n0xmwyj1G5N83Hxp7mH
 YP+EoNTXwKumKvipYJFHl54BWp2+w38=
X-Proofpoint-ORIG-GUID: -t_sxLOX1F8HMitjWXJ-H39IjSfj5M-N
X-Proofpoint-GUID: -t_sxLOX1F8HMitjWXJ-H39IjSfj5M-N
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59ebf0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nhjk29dkmxWQI0xhc9kA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX4eI9Ukg8FxaX
 rxTUC5tkvM2IDpyHkovI0xJJEAVi9IswWngmE7ZOutyH9tb8ywpPKtMBJQIQ2o9biVVmaClpWe3
 umjsM8BP3MXdATTWABPHWR4vKgYbsIjGPxB1Ct7Ix3VgdRNy65fILuW5qDe1Zrcgrdxd8O6KpT6
 6RyASvhz//QVTEyzyBuO2VJwnBF9qsrb7kXMotriNvcEq6Fptb4GCHGEPT72jAgEDiiy2osBq71
 bGJLyFBYaE5cRK+xbShmjMr07M9j8ngAs2ZRcdyGzwfAq2cCYb3qzIjmdTOSsisf+8fGzwqr5Vu
 MpPec9x09TEoWeReF2pDS4ogctvVBDlxlE7o4OJDQjs9yvp7njl8QVDL/ihUYsBTWNDJ5tQdirD
 FKTxCPovY4l/iKdWFP4lRfKrr6n+QVaYUAyBgEDcj22PQMZ+nEzf9aZloa8n+XA+XZn98tE1YG+
 Wav/jnYOLM2IBvLHM/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170085

Hi Konrad,

On Thu, Jul 16, 2026 at 04:49:24PM +0200, Konrad Dybcio wrote:
> On 7/7/26 12:12 PM, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> > USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> > 
> > Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review. However there is a v6 of this series addressing few things
from this v5, and this patch also has changes. Please review the v6 instead.

v6 link: https://lore.kernel.org/all/20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com/

> Konrad

Best,
Ananthu
