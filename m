Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874280;
	b=GXLGeBWMTrNNDSkgbS8sYfa383uYSqc8pxkwvt5AzPWr67XoLbe33XUxhxfrwnut9dbw
	 WzpN0rrFkhdP62pma/WLbJKtbsmaj+Kz4xjsxRjhkyvnVpo0OPuhPKZuQiQ4eHD6hPVJ/
	 7fcqBiGKOefICtlZ1wLZb5nv9Wn/PZZYxW9iVexSnwmlrxOLqFPQSwdF8BJFPJ9Ri8ZhX
	 q8krvbz/ZD1lWCKhMJDOqVTnqqTi/j34OdoRdjzqnvJ0JesqHuug0rxqJEDFtwpvfEcTN
	 d59rAZAQG4iiqdm7aZf53aVVgomX6Lb/mO4it3U90D5QD2s4eQeQ/IxonhKx0tfpI7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jy0aqYqPffPsEgUgZ+ky8X8Ht3XgsS1haHBbJLOfvj0=;
	b=PhzxijGP23AehDZ4DHs6H/2ApcboepJO4yNi9VtdvV1ivvyT54DckWwGp981Djg6uKDD
	 NXk/o+ALte3L2S7+G3NsjQjO9CNRmy0RFlhhLOyibouBJQ+jpA1d9z31mUkUYN/iUoXe6
	 cA63xtDIh9LWae9QH1eZGxmXg2cbgTxsVykRE3M2f51+A/RstEtpXd+f374UQnieWxDuw
	 41QQ3LiYj72j+igvIYgBIg4rXOibWIMtNem3b1RNqyCJREMM7FwWhZwA/cm5gf/up5XX4
	 hXnLBBB6X9+A2d7rR4M0lxD77URZOldbUBz4oV1YDxWYYNHXFeOEOMkKEi6qTxJyWfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBj9O4M3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MASnK6R2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED26606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBj9O4M3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MASnK6R2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU4B72287157
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jy0aqYqPffPsEgUgZ+ky8X8H
	t3XgsS1haHBbJLOfvj0=; b=IBj9O4M36aMO1P829mPhDfY5Hg9VRZiqFcvPawo0
	S2+iCs7gk3OqVjzA09/wH8wR4VI648b8e2AhxkrvUHeBKHqvhbeImHQ+QtAMm+Xn
	g86tZxDt5bf7bPVxso3LxlADeDZCYYOB8CDNOwpQYUX00WMdW940NB+mf2FB94eF
	n3tq3JbWWGWNTJ7NFRYSw3y28VxaJReFHjlw5H+h8HsmKTSAoawOND4E3a09C2uj
	EBAG2nZHtC5ZgoS+LuahgE4fHKQ8mEVW+AgB9VauoomXMOjznqggYdeD2jjeMxFn
	xlxDNpmw2CCugK3qpAWauTI6dMiKERLUBG/Y9k7phSt9jw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruhr8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:37:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so346245585a.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792874278; x=1793479078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jy0aqYqPffPsEgUgZ+ky8X8Ht3XgsS1haHBbJLOfvj0=;
        b=MASnK6R2f97vwa+fHQd12H+F/3xgCQg5ozF/wTvX0EUXaZGO7ypCKwHWRRc9rUjZ34
         KP8X8AynjEhCshA0Gt2svtiy/j+7OX8adWwZgqP3FVnOSVaZ6aZL+FRp1D6pwiRLEHXH
         y3e05ulFc8YsTXTRay1pCQ4jfnEOA4mCXelcNJXLfjAKeIEcNpM+EUYjMrzBpPC0+INp
         Hcb+T1PDpFRjsHbKSv69fIDUAR0IUd5xr/CKeAKCGjTrcE+VGg5hG70lj1sWM/mMR5+u
         FFOpOaMQd67k9lokg25dLcE7rhM0dOaCI/r9IpigDCTKr/g1pANJw5yRVwJTeUnmxVma
         EoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874278; x=1793479078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jy0aqYqPffPsEgUgZ+ky8X8Ht3XgsS1haHBbJLOfvj0=;
        b=A1TWzy0zR1Iy7IwFqt/Q1H+OvLTQ0pNR27NiuIaRjGrxd+oF+Hxlo3QgvzyjZmCzx9
         tdzNBYuZgF29FEn0cYP8/JGEtCMUjb3wmizFEmxUrzMarkzgrkKyckqlxdqNKsn1BS8C
         FeBX9+VBo32mSHZb25gX0kI+MmysGU/pWW6hq7xnqnLIRez4GNgUe6lNThwf13kXsqig
         zDiHR1RwjcK4nJNBRBG2JdXKqqxx9c2nP21QWuXqIaHlxCk1j5ytIAWnNZfhsXsXl3Pq
         RLxyCY6sSYPIklpFTwSlQrjNF0WfqWtfBZLMBGcAMTFUq/rIyDVHzexqf8KAU/Y/Bx6c
         q64w==
X-Forwarded-Encrypted: i=1; AKwUvBzQ3Gq3a0H8q5S0ryGTiCSLO4YUQin4xYV5F+IeWpa57jBMtD7gtaGK3R/5hIHl9g0QhVbH3Karh2Bm@vger.kernel.org
X-Gm-Message-State: AFq9FYI9t4zdhZyZJdSNdI+xVHhh2p3SPiVw+WFdZY0skz6iqoUjhGYH
	WBTTbAl/gAlxna5hrw7WTXLHjQRxCjBCqRYJwlYnh5PiGujlp1xpeXcAqVeJexpsy5ZGj7kdQ0C
	73/eXZCUlXBvFiNx6/ijBne3VSeBjuDyYOmC77wtpktF8H8e2Yf/hNSoeE4G6NQEb
X-Gm-Gg: AYBFou1eCwiMGAFKHQgffk+FSKfdA6GIcbtFLQULFBkTKXrKM5RJH1fEL9Lz99h2oBH
	JuktUDwlcOwctpSkr4sgh79tU98dyUaNTR2T4ZSocTIun+H925pGHsEFYmyH7k5iMt+39Aik2ds
	W6zkgPFcLfqXnA6/rvFIw/SGcrQTEH5SWJ7wsgsleJIxmtLekCRg8VrBPV5RrOm3xlA0SKKPqVh
	74HzpR+Hsk9zkZdIgQUhfQct0j3nS2xEMcQNm217PYX8pzEs+UkU2CVGr2orzf/CzpTmqDfe/8P
	k55FQMG89JHZ2uGX6EU8IcgxobQAXv8zJMfavgsCQVuQ/j2P+t81P4hrwqXHyuEe7JAVszjtZvS
	vZ/5Y11rSbsBO8W6K
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr408947885a.51.1792874277835;
        Sat, 24 Oct 2026 13:37:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr408946485a.51.1792874277315;
        Sat, 24 Oct 2026 13:37:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm97518475e9.7.2026.10.24.13.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:37:56 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:37:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <rkqht55ldjidesqvpimk3uuuagali5kaufgh7gdwgy5wwrfqtk@k3p6hmrekpga>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX6SQ4J8JSpieR
 fCvmjcLz73uxmreyajj26M4R6TuMVdEUikWKkoqh2bZd4Lx0SZCxFb4DmZVACRRy05kUme8jWmy
 umwdaIem/E6RF02t0WYKhBBKVyA3nI8JvoMpNfFLocPDRfLSQP3e47vKYqZLmCPKZbWg/E9Z17k
 lq5vTO9nHKp8GNi7cAls6LiErrxK0cZRJ2ANdasqrpU2ZCfAZBjvFHWxCZG0U94bdOEVDfpPpZB
 FpzTv3Mpd0+rt/C4CSL73S4n2igRCOuwjxmoRCM7aEV0dSDx2AD5zGT0ULbuunF/TnEXVSLuTbF
 KLt0wy+9wzarQttWR1hHjrTkXdSXP+hzRSdiusPFrklgdnVyekG0uL4uddQG80P3MNIHsrOl/2a
 ywkMXXTjrrQ6IV34vXQkJQE/Gi0C7Z/RROj/482QzmEnLvYB3lmZfF8RRlcNAYfMuvHEEDFffOt
 7bewgNViPZdfLpDLwGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfXx7FiqBq5s5SD
 YqyEnNIJvV1EI6fITjDwXd0ke8Tu97dPsSEcqgtlp9ZiQ1bnHshSbu7LfPLarmM7FqcKqeX8q4N
 hCZFaczu3Ld6gk6lLnrooy/4elhTXxQ=
X-Proofpoint-ORIG-GUID: 71L1We8d0vzF1RcIF7YWqSFST_9e_F6u
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6add1726 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Hy__DvbY7olCP01rSc4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 71L1We8d0vzF1RcIF7YWqSFST_9e_F6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240082

On 26-10-22 17:27:02, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
