Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090A78F26
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569843; cv=none; b=MW1G1++zuzUDisUhwoNafhAASMtFSuq9r8OThK59slMaDrFR/WkIEfWul3crwROtftmtx5Oj/mxmmU+sK/UOmIakZLHtyr4x9fd3fuVcEPabCtXxuWSqI3EbSKYcJ04qVFkYijplDZKvYpE7tHfzGEELbvM4VLgaoiNqSkYVgL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569843; c=relaxed/simple;
	bh=TRJG9+1ZB40bVO817nPs/2tJGAhkcQ5cFkt9ukk15J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxn6Bx/gjvEdTNwQImwC0aLohOBdchs5h1AYRbm7n2a/Rt9ZlRRYUp/1uuD5azQTMV2n2ZLUl4Y2cHYqQKoT2dGpRsFBC6P8DAeg+fAWveCORkR/I7uKdNGufKsMp/M5xyaqA89VqfhsxtW/K5ekaWJi+Ndu12TPAs28PJYOE2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zt8pHVF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCq1NmP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zt8pHVF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCq1NmP7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OBT51592535
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OM8Sy69AmlhuB+YEEPhyCqX4
	gyG3z42cZbvcOsnssW8=; b=Zt8pHVF4FrcgHVf7vXUX7wti8nNZrth0u9FiIGrr
	ZbAeg2QB3otrwmu+PmMYnRo5DrsAY6GDC+SyqiuzCcDKDMekb2LoSkoTa23A6cBO
	CTlLnbHReV5vC7nunwj1O4TonKmiU7NvErzT/GIIhf/xzAQOPw5IYhWDnAidHwD3
	bryvW0xHGzZ8n1BAYA/7P0rED0olamGMmce/is87pLDs+48jt/dRfg3GIw1HbhBZ
	/mTISSue5+yKCBYlvGdMZ5KjEehBG90inXQYSOvu1NTyNJrUOkyuF6fJCpnTopGY
	YCDiD5ktx7vJ9Ur+PuozXSCpaDyrBbFJIcJ+9XvPEO0Nxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73qnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:30:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so443408385a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569841; x=1782174641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OM8Sy69AmlhuB+YEEPhyCqX4gyG3z42cZbvcOsnssW8=;
        b=kCq1NmP7hXKIIHZVgsH1PrcN04Kd6LmLs+VFMpgn+whgfi9wCksCs+T9IwNjzLmQTB
         fuKMiH0huj5KqszRE1oV+tM4FmwtputZ7+Aw5ieNPuvTq8FTs04fBiVlmssrWEmpWQmr
         C9MtSWv/77bUt8BWemhB5KcQigtzfdpgpEECgeY6WR7Ju8qbenNRGsZAfhF1ge81DXMH
         dmofDRs5R2FwomHf/W9uQEshVxjyaxwz8oM8+dHKC4umcpN/db722J02NI/xzdiiyuDv
         zBRBSYE/1kHoLPmZfiujiLj0l02hGzrb+2pZ8vYPcxq5rHUbAVGAyrxc27vp1PpBndCp
         EOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569841; x=1782174641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OM8Sy69AmlhuB+YEEPhyCqX4gyG3z42cZbvcOsnssW8=;
        b=T2AC/VWp9j/DSw6dbD8DR7WzykKI4mdqKg5ZtC2OGN2XWMjeLlJfqxy2KPyVm/prN/
         kSlnUMslyQAkjVYirfuGm41gd0hZQbj+xit1/0Nyme+rX00VyZbJIqvGrOCXh1b5f7pD
         hzu/zJjy58v6r2vbksOS0vCQfwVQSSA9RzK4mEnviydNZXu2qkCA8qdhz7V/0BnFTg5L
         wTYkvwZzGyUFrykxSboIz1+BYPoPOt6aUk68ea3v/de6LojGvff7N07TnTUdMUp3URBI
         gYGK19NyujAHDh5YrAnd0reXY4m65ubwliUcwmw5iccc8a9RbxowEJl1zgHOe2usyhXo
         /EVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UQP/bLTHZPYhbR9825J15fVkzjtkiRTgmCkZ2pL2YKvJjYnueO9l86kUS3jFDvC1eH9ZsYZd6tuip@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqNoXwzm36RPptAPuBGUjCSkQ3p6vRFbjviAcL5HABEScjGK3
	+NNiSzFAtrE88krCD6b5dsppvNSj/0t22QSHzXzMkXS/tUxSVwdaR67iKniYBbLHTByyY04ZG7t
	RmL01VsVKZe2NMohP3QdJqcYcIq8393oyWcFAfY4Xhuy911XpIoPWIP5C9MYahDo/
X-Gm-Gg: Acq92OHXVBiWV7b3907cKdlR8Ea8HTFqMAf96VsZiYvg7slt2gRwmCrO9tqtiNJLxoE
	U1WuAVtbgTh7S6WthWDO3bz2c2yNWcLTvuHod+No5BSdrUDxflumIjVE/LJ5UEcHWRvEy73XS43
	eobCfLjS4DVttync6kL2Su3zYWL+CoREvr6kStnHdMsnjaCwh5H6QI77a9RXdwjY5nC9YXvGGJZ
	gq+cqtL//vnTEUnSdBExgnD3HSZQbfiq+DTVTaG7JgSV9HqRvnbS6H1ztpKvWSYwwtBR+c45Pjr
	D4ozfdTaL23eTgN5eYX0hwBWHaSXmc0t1hYGNDFm11/9DHHDWKRlENFwCyryLnNV5ZJB5HO/8Wo
	rlSh37xehDRb6nc+Q04rC1SHTTLJLV6Uj60Smrn6GV0vm43Ghph5htnBePzRzsa8fMI3x0/SM+g
	QkTAVXC2n/HUHMJE8NH21pKLYFCythY+Z51CA=
X-Received: by 2002:a05:620a:7106:b0:915:a953:4b93 with SMTP id af79cd13be357-9161baf5670mr2579887885a.3.1781569840572;
        Mon, 15 Jun 2026 17:30:40 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:915:a953:4b93 with SMTP id af79cd13be357-9161baf5670mr2579878785a.3.1781569839703;
        Mon, 15 Jun 2026 17:30:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162222sm3144448e87.17.2026.06.15.17.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:30:37 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:30:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <p32fxlxsjtxbo2i5wqvrt3dxh7ozvrhqby6xkgpctmfhe2npr2@kucx4sxvijdx>
References: <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <20260616002148.EE7CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616002148.EE7CB1F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 4Drs5wUV7Q6REe0QYxBczSMnSgsWXlPE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX+rwUMGUEUjDf
 A42Ro/EBXl5Q2JiOtyeWZNBBmojqvF03D1pnNOLrTHo+4vVVqPR/M43VjKr+JEGcECcvYdcMh6T
 02LdDnX2ahdc9+6F+n/M3rD+9PA/joI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX3d/epuVNOonr
 06OSf0Qxqp/Z0jSUUGGfjYvTDzcAiVEVle88oO7Vt0a5HIn7o0o/rESf34pGtIYne41XLoedAR0
 5K9qvKCrNZ9tzj8ozASKoc3TuQxXq5/HXDGMBu0La9Ino67dmcTED5mbzIWOZzjVcTndxCmGauT
 m7VIVR1KNORnbxgBRWlFp1An9mOTHUInLifg/wbfKXfXICYk+0CDzRBjJ43urmj+BJy6mZsFVX4
 O+EDojCWc0EMNO3P7B2V+5DTi+wDnwn8P6XP0y6FX88p+1Vkt5AL7xmZqqTUaMFZGvzzXB3u/BY
 1oY3ra25wZYCZooVcrmxO+RC8W8fDflCJidoeSa6ACa39O5SsttXowEIY85e9bnmX4SrfHhZP3B
 OrVE5sheobJcr9h9u3Uf2waZ+n914lMIrZRTbkwcVATPtUDSS4aeDRfNac9zPK6HpKqlpq9qjsg
 SVYX/d2DHXowDKeCqIA==
X-Proofpoint-GUID: 4Drs5wUV7Q6REe0QYxBczSMnSgsWXlPE
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a309932 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=ErpfJ9jdl2GgYSnf1vMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160002

On Tue, Jun 16, 2026 at 12:21:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The AR50LT decoder line buffer size calculations accept an `is_opb` parameter but completely ignore it, failing to allocate memory for the VPSS line buffer when OPB (split mode) is enabled.
> - [High] The AR50LT BIN buffer size calculations for H.264 and HEVC ignore `num_vpp_pipes`, preventing proper buffer partitioning and alignment across hardware pipelines.
> - [High] The VP9 AR50LT line buffer calculation omits critical component sizes for DMA metadata and QP maps.
> - [High] Missing SEI user data allocation in the H.264 AR50LT persist buffer calculation.

Vikash, Visnu, could you pleae check whether buffer sizes for HFI Gen2
are calculated correctly or not?

-- 
With best wishes
Dmitry
