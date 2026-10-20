Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477881;
	b=AZJUsGAZ0YvtWty0WG5/XppQO29sVEdZw+gkKm6+8pjr09Ad9bJKE78pweO+7Yngq0qf
	 lhRm07ZVzForxoovPDScT6uII4l5AeBTiL1OgTdgJhknOBpHwbz4aOsILfJDXOv+g6mZG
	 zTNJc7X7IiyZBOJBpXXcCQkPrhm1P+YejiobgGXLSyQMiihLxdRuDrctpY59DQArZMKsS
	 AYPq4CcDXGttJHTJDBqSluY9RY/S2Z0ont7qSAgCMQaPU62gnTO20BAmU0ZYRY65UMgKV
	 erg4yswcwuUKsV4Hs899nMk9d/aNtxJeQkgO8nqLGb103fVQL5J3r4L1ktJs6NutSzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
	b=l+7mnlIZUCKoX+dFJOCRSyVfANCzBLJqBkA0h/+1y2nkqk8wwjWLqtSGoyep0l+HTmnX
	 +5CClFN2aSCyY/kDgy93Te09nOhPk9D9NarmqzAurmCNrxMqfB7AhHKw0tJMdLwhxX90q
	 E8aolAy8dUpUtFHqL30GHf8+pqsDJ7v9jK8wYJ9iwMCNE8cjc9oGnsMvgpJqesYqh2p9V
	 bqYvup9Lq3xRIPvdxdkr7HHC5fdbYc9zw57UeSTLv11MXDUnWY2mMpJr7A4hG6ruIHNbs
	 /EWr4MZQitEyYNVAYOsQtqmCOD+UDr7+cK9Hmq2sd7oA3leQA79/s55YvtijHGDgIyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GJeOLZy3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B6606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GJeOLZy3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tJqn620283
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=; b=CZfoH7RQmv8/vtfE
	gNKgogaPsrwkO7jBSRgkoIZ1WgWVsfNwRrHe/vbbHApbFlHyp6jqOtDU1hcbJ7FM
	Lh9iQFSavTU52kutaAeP8QPhQZL5aX03wau9GBdndavqtstEZ/Dvnaf41kXOSaOQ
	Uo0YYVjmexQU6r6jjUyDtoWg8Hgxl2X9cPjEImE+Jt/aeVX92aHWetM27rgoaMrv
	is6Wnrki+WKvhOPa6l+osIkfNMbz3XWYbqk71qnqWDc6CB6lN8lv1ohBFkbL0j2c
	KSy9zX4eP/epdIU1Sw7bUG97RgRRo+U1QBzF8W863ygpl7AT4cO9o77uCtEgAopu
	ppppng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ns4qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso4891691cf.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477878; x=1793082678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=GJeOLZy3EJC2FvkUlpK8R2Br383HhPrEdqcat3nag5Ww9nXAoEn4BBnG0XXwjVf/sh
         anOuDc3EmMWy9ID7G5hunx1055/ysQPFvo4DGN1oOyZwIcnxsl19HPElP+UcsBEMHGsZ
         ZLA/agFS1znGxF3wsfe1Lg9k6VM76Bnxv+OeGQgXoEvZ1jgKUryZXsYJRdcJWhKcyOGd
         OkcNzAfsis1vXFRGn2saeUzEx5fnWLBCLgxJQkIjsLj7cw5R/AkS2i9cxUaWnZspSVh6
         C/DsXI8k+HZbW+4koOmIHa/WWbhnHR6opBanrZeBjIx01e3pPMXgyglG4yQJZVYr/sA+
         5Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477878; x=1793082678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=JiEUIjoUcS5WSn3P3qEefPlzICI9xY4aQNC9FUxXBCJj9QpoCcsWIN4Svo7yVa5Zxr
         tmLbzcn0+J5ck9uAL/QDEIs6xU5sADxu2XdIL7MFfQu+kXlrMb6YE0Dg6ZESpu8hRwe9
         NWa5ToJqaj6c4ERWVDaSbPVF1ivmMyc3jSZRBi8vhMrq+Ww9Fc+FqG4sQqzKRBanZaT/
         aEEteGNVlie+RpV+2Lb6Le6D8jR1qMpaUPzpxKZ9j4dKdS7azLIGm3fbl4cqwOEArvpG
         fSJbLQSDmCoDMd/iJP8EkMpOgYuUw+T9QVfNXjZc2RhWCwu3TNAT1SxiPfPRdyDF2Pu5
         E5nQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5a6azprOvHkOhivFFxSED7QsTQX63WdOduc38DXyW5B2ROXUG9n90aTeGTsQLn6GnOAxVsvr048L7@vger.kernel.org
X-Gm-Message-State: AFq9FYIZUIsoFiYNtND4ff+xeWKufnLonI8C9b291XHovL9o2PG1z8zP
	ZSOJ5mbQTF73jz8RXBfAR6X0y1k+hAT0zDK/xNw9nh+Z72li0+e/IKiddvAflCOzOmcbvCOt1GX
	F3knhOa08s8nZvaMXIaFelsr+e3it7Y2uU/PBlfa6GSIVyc/CCC3+xLV4WparnCqX
X-Gm-Gg: AYBFou1YNjGfBsalF/imLLSZqaZhzCN8G97whdh9Kkv2jXUeUl9hdsbaNTgT8Ng8bGL
	drPP5am+bLu1ZFOpoPea4l/oBAuqXe4QA2dgdjw6e6cS4GCkEfRZwGRm6bbZUvGl4VVl394ZFgU
	60kAnmdnZTqAcdPkDIPRri3mCw1wLegjifYn3eXE6ij/rdqYlza37Sfhznt1ekNxDjEber5pNP/
	VjsPv3Mq7cxso54ubYTQ/q8gaUBvlp/CX4nRSTZNRZxiHVwSwCg1AB3FbNRLry0UAYNUdjUjGxc
	BIx7EESZIBr+5bk3dZwbJczITq6EeTKdKa64CrEMFKvROfEkRZhmfzODvnG5JaAzG7gkwFcqaLO
	jGihBIpoFnPQOEjUHfvPaTA==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134541cf.3.1792477878564;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134161cf.3.1792477878105;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm447200266b.54.2026.10.19.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:31:16 -0700 (PDT)
Message-ID: <d1070a58-98aa-4a98-b0a1-96e974be5abb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:31:13 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXynp/ans2woqn
 jMQWylpXCVx6nao5gQJmIVGSjIspnOa1ivyJC08DXz/RxnSnFquczq8EgpuEwxb4yE/JafHpLUT
 P/mubE/CtCEZzPVXrqg3A4u9vE9UTfY=
X-Proofpoint-GUID: XZTMj50Np-bw5xQO5TzYlk_C33TMidoi
X-Proofpoint-ORIG-GUID: XZTMj50Np-bw5xQO5TzYlk_C33TMidoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX2oW/YQnXr6vV
 qi5Wu3/IHQbtRSTjkqWt9f1AvuTeuB+kp2zGxww1qgb623y/8X2+iYGLmU9fPSTSOmWIkQKz0wO
 0wIIAei9hGUbqkyF4Y5E57SrLmvg4TkVxLVKApWlU4hxY+cITP5O/2+O1FuNwbOqsBaWvJVH7SW
 5HWTtMRfEl6QADYZ8LhWJstennMVcp6In26K5QIUvcYIhV9ov5qA2kpr7UoQGXk5eeLWWrEAT/d
 KseCmPDxPAcGKZfz0QxjdwJSJ3rOiI2q7+8RmgU+XOb4RfpU4+s/3pwGEm+z7Xh7GnujqFdZRsw
 tJ2Nb4AFzsP6ROszkv2BWEXLjJ3AkEvBC14hs9bk2wFCDBRix7YK0UjDPdpoc7phCgGQZInMZa/
 4WFjrku+EQU8OKdWJuS8zhiXlTSj9a9HOD3bt6vxJezPC35S0HLPlutJv7CtBerkMv6/Kqr8t/i
 +BzqZoYjTE9FXUH0i7g==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad70ab7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ldyKz4HnRpUghmHhsoIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused, the SoC resets while the
> modem is being started: restarting it in a loop takes the board down
> within a few dozen cycles. Nothing references gcc_mmss_qm_core_clk, so
> it gets gated, and keeping just that clock on is enough to survive.
> 
> Downstream never registered gcc_mmss_qm_core_clk, and dropped
> gcc_mmss_qm_ahb_clk because XBL controls it ("clk: msm: clock: Remove
> support for the gcc_mmss_qm_ahb_clk clock"). Treat both like the GPU
> BIMC source and SNOC DVM clocks: stop registering them and enable them
> at probe.

[...]

>  static const u32 gcc_msm8998_critical_cbcrs[] = {
>  	0x7100c, /* GCC_GPU_BIMC_GFX_SRC_CLK */
>  	0x71018, /* GCC_GPU_SNOC_DVM_GFX_CLK */
> +	0x9030, /* GCC_MMSS_QM_AHB_CLK */
> +	0x900c, /* GCC_MMSS_QM_CORE_CLK */
>  };

ideally this list could be sorted

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
