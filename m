Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723635;
	b=x3ZCM81PeNUaDX+qo3HgprwVA0L8y1Rx9+tkywjdcjj+eG67JDqHtXlKcZhrM7pMLM2V
	 boInJUaVhjuOK/kegAo1XlTOELdUR5mGuEMf+MjkE2QPiGtnh8glc/8dVeWCrito+9xwe
	 smj8EAl/HDztIWucuTkzffraVzjTyZFjjtfBmVyH3dH8/Cm+ojnr1vtM3uJlxK/uDT50l
	 W7cCT3v9xKzwPUYldE8kfMl8tscwpHkiaM7NLc9tfM8jIXqATTks6e+QYjETFg04QDpGY
	 QcaLMBgXNUQiukYt5wXPfnGFW6/hYZXpm2ReP6itR9PCebiDFgIYcxNrywE+mIsuJBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
	b=EqixdpIN30DTJKC5leHpbZKped8wDXJQFKbeSmDfELXzvild8oOPMYJdXva44Zde5Fxy
	 i4wqDqPTSafR5ESacSmsrjUa7tlFBoswcm+NnBTqQOixfz+B/gswVGzmU6y/GBFa+rxhx
	 Glnu8xQoJXXhQtZcPsT/pNPyTSiUPoOwsVUuvgD+SuJ4T/GSHOAuNS/ZqfuEjr233qrM+
	 wG+3Hm7Hb125Uu/WcYnkYyXrK6aNqzbEWa/0bwiOIm5UgCq5b+sMUB7/tAorDCh7azW4v
	 Ahp34YaezfojKNhKupZiuNpiHJwYyIxhdyWwNhc1W5mLn58pjVdp3WECie/iyp8IFNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T77eDZvy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/6sZM55";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F321606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F321606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T77eDZvy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/6sZM55
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F1on1335237
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qzkcBMxdB0AgfLpu2YLCDsMP
	/8JIkwWl1aJT9/SZT4o=; b=T77eDZvyacg2/0VU57iAnPJXV5NrUeliWvH1hTnb
	Frb56x5WfoT31b/pPVtODsxU4IS49TQJbCBwAXMJ80qLUqXTEEMlRxgoC78FWD7b
	umRRcUrt3ZbGZOLz6ub+7Ac+8kqTkKaz+GRuQG4Ak3+9ScBxA1wZJqy9FOZkWqUC
	TXLIJaU5E9mHgMhvUasPKzk0ACEfzvY1bf/IHkRjAQkr0NjAr7D0sEPWS3xXqEET
	jpJZSqscTjcdAerR8HKFmzYtuC/63mahdzFokgtnv2SZCGL4iaQ4ypas4XoSSnXV
	LLregcLCl1FYXo1PBKE+MfaEnBuLcPIc12y1n4/+kbOMQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyk902m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:47:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3692c5b061bso1301595eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 19:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723634; x=1793328434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
        b=T/6sZM55To7DlbG4liHHfkiM1enTifjrdmyO9jdLiROJFqdeQHwUTE9ACt3cCBGcty
         NF4ruU7XnKleR2W5KE57pv2jmQLzg+xKBlKqQdM9RXbxzDLhoZE1juJGegWRTnT9E85e
         zQykmxDYaGVGCtYb6+KWN1N/2hTlHly6+9XTunrjaZDNjL/sNUh8QTFVVK7von7VDfal
         6TwFz7sLoh1uHY5SeEB4uxGzYZLi1Dyn05leUKTKOaRnW3ZnLvHtRWG7gdCyeCGiEIaV
         tduFoZYTF7VCLNVkTanlgFjJBJC5fuprS4N7zJUiKFwDw+nh0MfU7NlqDo2r9dzeyyrp
         bQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723634; x=1793328434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
        b=SwLM1feZhCFxpqyjVxE8+eSvMG8upLvILa80LA56VYisORt9p9fqvbpggwZDkWeqcE
         r0mE+UM9e/r2QVnxLuK9Lh0aqt7grVunk26BR5UNn7d99gxWuUz8zKnAAqqfuPtkFKuJ
         VLAYvmk1ufVpHfHcZCDL7OzoC6fY8+vv+pzgunoOvDluJcXzggGXrfR5coH3+sobsg3u
         BhNxUhwivsnHFGssFFuSSovKAmbGHFvrOyMmFJVnMYWCZENAkXBzfOvC7XG9cUHxGwNI
         Hyb9EXJUUtJdqTY8LHeUInR/c6gws8/QP/PYri4/injNuqNZgZyNzJGopPBHkSIcJYh/
         nKWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzscc3PaqFmXZa+YOFH/8itrDM+qJrhlLxCxm6pz5olgHlInz4vwTy/4BSyG83KWUpjlcAsyac/09Xt@vger.kernel.org
X-Gm-Message-State: AFq9FYLLBt9TB3i7q1kFA139BDuv8qqUjUCnCZAZoYla2O31qa3NUqfD
	061rRZUM7JP2x4TX9zv+mlrlS6e54ayoZNeUicMRG5RYv9g572Vx1tyi1TBzNDxpIe6pNBMUgyj
	8fACMxLLx6Wn3C0xpFsIdjH6C8OXYMqMz8GFvAhVd6i25VZqibkMa+H5xtCmg8PaX
X-Gm-Gg: AYBFou0eLzpfBlIIs/hm1B9Z/UoyExLr2JNcNizvYyd2NyxY3yuLgeu8cUaG3Uo3rfz
	O3GknmwJ08Pu7WpukNZOiLXjT+WreqZtvSf77yWkH0f3rL/11CGDS8JPdpQgcTUdDFcpJCWEkyM
	qXk/v1K8PE3eWipb5fPHidlPK7HU2pbMWpUCQdBSMN6JBOACDzY6OD0Pgjvri/r6dFb2nv/gXcH
	5xTQjqcyASSj5YlIG4rTAEkgx79XDSwzS2WntX7DRaHckpD58/31x/ztmn4o6GOnyADGEQfzIBx
	gahJxl9WtJCIH4WPC/FyiWA0hlSElrkqkypDCkN0hRplaM3gAyebXG/zPkrkW5/Dq7Q6beBHlyf
	YO5AmBVWy7K/SrSveFpJMB4DxB2bsghOeO4n0gjA/Qg==
X-Received: by 2002:a05:693c:41d7:20b0:366:913f:4d27 with SMTP id 5a478bee46e88-369d9815875mr1237564eec.30.1792723633838;
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:20b0:366:913f:4d27 with SMTP id 5a478bee46e88-369d9815875mr1237538eec.30.1792723633344;
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea18sm2727851eec.6.2026.10.22.19.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:47:07 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
Message-ID: <atrKqxb0DgExzYPl@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfXzAbkybqltjUW
 YDnzNmG8soubkiihknRH9MtPSle6cqrW+R0FvNX97GeGClA/4wK5Ak3To4ZfgffghknhU8xvhyq
 9LuAEjCGh6InIhFILuLwhWcU1h6grna4hzssNbZacP9Vo9jsJf/8Kf+56soQ/NGk5j8roA2W43S
 0dFDjh7PGXcZDGtdKG6qH8IL/qbU38Du8dQH36DuxK06d2meTpZENR1RDtE8d0mk2qIesIr/6ay
 WFRtI6yrsTrk40shSNixQi3ZpZbTgV68xgp50qcVzCXmdZnMNU7LAJZHvIK7Ue0P9Df5zkBe4k/
 0nn7+l2c8iuWO2yxX7XEf5fD8Ain4kni2EG5H1iKRgHU7z/HvehgbOvq4CIUo/9NfPYqtw8Hplt
 iX5QwJTyBM8J/QCCTi9mlc1/3sOA4IEm7pB/HlC+ROwlqDT5v5zs1uwlgNZ1bOmoSJ2EApI8JZV
 dbDAJNilPvN3iswZFqA==
X-Proofpoint-ORIG-GUID: WYnHOltHHCVGwc-p1sFXDNqegCu7wUvp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX8U4LmskUicyg
 cPmx8XwzQwV5GivBA5/OJAbG/xpOMkhuA2OFJZw7qJIawuBoGranyce1ALWTBxK5H4nIYVzsS4T
 DLFmr7EYrWzaynihYm/hNvJctoIPaNg=
X-Proofpoint-GUID: WYnHOltHHCVGwc-p1sFXDNqegCu7wUvp
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adacab2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YweHfVvRe2V-vmamJHMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:03PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> Ride Embedded board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
