Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4DA43CEFE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912126; cv=none; b=hzQStstWVM/hyWPRCo7m2mmqVetBVK4/PfYyvKuPOG4HoFp09W8vWTwafBueC1ERdDfD2KA0T2Z3lygzv81WPOwItsf7+cpme65mRkfLc0i5z3u+XZJt9q3q25xomqIhiN7YPE+BYJybCM39hGJXD9fgA7+mg2ZVo9YZo4jrFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912126; c=relaxed/simple;
	bh=imUYo300ApW9+d4uFzn0MvuMBA15s6GsjOB9vKaypgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRisqRO7SRzTH9mA+sDehs/VudvaYZ/AFGdx9HKej9bpRJEVa+RuXE12hNqvoJgdmz6YQDsKtl//AW0vZyz8SPuimSoYvm4kTZSBPJH+Q2JtIHrVWLMPe49A1z/k5T+PVoLwUJWjTxqdBYxeQUEOMT5nub1WY45c7QoJzvpH0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT6eI/e5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hm1/60bm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT6eI/e5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hm1/60bm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hFf744622
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=; b=PT6eI/e5XC3Vp+2L
	u72/5Hg9ONZgRtEGOgS2NqthBrvy+0pT8hADKp49sRvtfvoc+G69iQHTMEhyhBEt
	ZLjXkMqLDjURVp2PfLKH09eNBt8SneTzD6uWVkFH3n8sdZp3H8V3OQorqgIi1X1H
	Ur0MfOjpN5ZPjgTMmbb5xFe/gwvPk6gPmLWE0JM5eU1R1nz8kfW2+gznY7BE2GFL
	tjcbVWk/4pCGcKjVfklbTMPNxpdICaEk1STSzx3Ivd6xRf8SE6oRrrlbkjTjxmL2
	4bpxjKr2/dFF8KQZ8XpW8QqGIB5taBFFhNO6Mvz3Xczr3u31FYA3lSXDSpFLxDqn
	ImNjPA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thp71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:22:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-734f7d8bb37so42577137.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912123; x=1783516923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=;
        b=Hm1/60bmq4wQfX1QHE6HC7YtdigXG/0gTxJPO7idh4v7dc7PgLBGIil9IQ/BQxhf/d
         jhrMLQz6g7ce6oNITR7vU+DwEK6RBiejmvN2XpcTuc674VTLIz84zFR4OlD8o4JE3mwP
         y7WKK/myZZRvfL/11iRGtmnhIslEh97Gt0mGzfDVnyvK2Am3Ym3ljTJs2lFPcuCxb4nR
         DrKKBYEfFGqI4hoddtQJ9gr4SQWbv7O+yre1Yry3uCRqGm40H6QgCKuN9+mN58csAAHy
         Kk5+3ndYjRmaHMQsWuVjZbTwya44Jy0D2IoZcT5UumFNL1QGJvUcVohZNFkKemfx2NtD
         +EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912123; x=1783516923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=;
        b=OhpNe+xyLH7cM7inSDRBL3IGJE2YdE/DK/jk01dhH+MlTvLl7szj19fxbFOiu7kLew
         Xt2kVtOgdFvpaloyFGmBqUZg9wODgcfAgvorVUAqrqAS1nZ1WfxwI43TDLIYV3krq9p6
         NBINJOuqc6IF3Dme2gEwsdkjLf6HdSW9cO8iC22/z7QMkMxyuRpu1xBW+w8iRtgui+EQ
         Si1A7g28lA3td5A7bz2Yp+U8SdtbYJLj96VhocPtLCREQHTnfz91ybfh9bhhFR23dHn9
         990tgawUt6ZRcOwsA9N0EZZf7LnsQrAUe7VXOXKCiSUMG0tayoeycEWKZIG2N6reDzkV
         k/JQ==
X-Forwarded-Encrypted: i=1; AHgh+RoERryuKlG5dMRSld1jICjEqrXzuxAc6oZs4eDC/hTwlnMn2XOYLCJ2rx3fQNR7ke9B8PtqwpShCY4s@vger.kernel.org
X-Gm-Message-State: AOJu0YxXp4o6a9PeKA/HhtpzT/bcnfpf40d8fN/fikPOHdmGdifrIlOo
	ywN1psCQlwc3lHdc2yLKyF/i25o9ub2aDhQ6s8U5Vrya2KSh20rN/UFI2ISD3iwTXhYCG01Mg8D
	GZMPuJqCGVZKqH/NhYGKMnuZl6P3hecGEYE8TfgmJ5O+ZXzjJV9ZPka7k0z+KCW39
X-Gm-Gg: AfdE7cnzbhuqJCSA6hQ3faG8+4BIuydSv1BIJOPfd4v9ig9kZQaejAQObZvBKRNtAbf
	CbeL9nt1Frs1w8dQ1iYqX+DxnxEvjjsT+q0IWwXoDm4Cjyk0HcB0nc514Hiwa/D6VdAFiExJD+4
	T3TSpwSH9WgVz2CxG2VU0ij+Nn8tGsDbnuIamqi9Fhng0b2a0wg8YWDfTNwWoUsdtivwhr6qHJx
	2Yjeygz4JsztkCWi9hnQADH0J2LZPtvwidt1gMwx2li2LAIi5k+DVp6Ok8BIcElCxuZ4yUgSEwh
	n8PZ9pNXQp5uT62TZy6g9Ln4xHQ+Twc+QFqsRzuqsGaN4pqYANxZuLEWpwze77cGeDu6auyAKVs
	dOFj+yAeAadIWkL67V2QxnnT3fb/yGdXNszk=
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr199504137.4.1782912123374;
        Wed, 01 Jul 2026 06:22:03 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr199495137.4.1782912122983;
        Wed, 01 Jul 2026 06:22:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dbf4b4sm274203066b.28.2026.07.01.06.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:02 -0700 (PDT)
Message-ID: <e232f53c-e610-4c73-b1f4-2015f50569fc@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:21:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled
 via critical CBCR
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NheBKiGUQcIZ8oqlQwXWhqdzpDWbAqI6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX5OD1XatmLyGZ
 2uykp/1lueFPdRDnuyqpSk+opTSsioyPgieFWM5AB8UV/k4MMOBOq4eYiq/7n2e9x5qqtLAEVRm
 8IS5+i3dPmzfnbZQCyooCpz1EgeLjzE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX1PcVr8m/Ubom
 MmGsC5kNwyrCkTV7W0yIIJ3PMkkdTl3kGtrcfey6zeMxz7paVpR1o6rUMteM73RJ+mabShB4ViM
 gdGC/o9IlRgYmulwhSwRunqw7qmIVx5a0uGPbr0QEO9GhjaVJ2iownlfsLVpmQPEca77ceGiy1g
 2O6UQZ3zFbgR2tODbO1gMxR8bt3QLwznNBNF2XhjuD7qRQuhxMFbEie3H04aWIf+El6pB6bxbx5
 Ukzz8GV1NdYnnfQ2YgHAx/vJMcAItMslJ5GZ4g6Lm1A3Bf8Qoth3WsM26M1jJGhQ2I1Sc4S8rqu
 3pjyZdZYoeWNAumDqW3YVWYku4V+3vYPvQ3GpT2e4Waw7IaphPfvkn+0TPZlf7QpvNxXnO+cxi9
 2huBnSmGUXMBOM9jHzHhx8xrg9worIFiEXvJ2fAjwkhj95RzD2TAMSyD7gVdbIoHxvHvTS5D2j6
 VMMDY3dggYiv5T4F+xA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a45147b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hEmD_o_XFUzyhzP6z_0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: NheBKiGUQcIZ8oqlQwXWhqdzpDWbAqI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010138

On 6/23/26 12:54 PM, Taniya Das wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.
> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
