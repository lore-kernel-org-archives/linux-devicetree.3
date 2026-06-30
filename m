Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413893E5EF3
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810838; cv=none; b=Ljrc/9an4NR9wjwLHxW4ZTpWrYhgDzWUHLrMHG63+mDWYkYlDG3xaN8OawyAKQIiCfGbAYnpfKB0hpnGOjQNqiceMVLHz36oWFoJzQAO8rXgNWfUbGD2vcXaK2INR84nTHMqAebdTc+kLpfoUKOm5jhcHxidl5kelJbLWLjDib0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810838; c=relaxed/simple;
	bh=d+mLD1x2hxZDlUEdb98SKIREx2londngUqrUjv7sJ5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XI8+MrD8P/pHnxK8siI6DF0mhNF7Plukh9g+ayCz3hA+oBMGcVIf3bB1NUhJGk43TTpALnoSSJdDZxSyYApx2FrhqK3iN4/45CU1Xe2Or2gnMdmow/mfITNzJZEcX4Csl7yA6+XcrfKv2SiexA/soXTN2k3g6K5wWtfRgya9eYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBm8GQ9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkqZiYXo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBm8GQ9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkqZiYXo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CUo41097910
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=; b=kBm8GQ9HH3km03Ef
	HsaOF6dZw3mgIp6zp0NSEyXrNfz1S87nnA32TqLfDZqW+5ZKMRORKhZY6bAPdMHN
	yU5FVOcNo7tqZqgb8Ag5h+tyAnNuZD0WOveSrNGHuyfyE49fJch6R3Qan2W/aqlm
	eOABFZ+m+X6X6jOZSaHdrrQMTcN7f7oNdJh8tmKokkzSk0Xmov0GhN49LSQXZ6GX
	BDEyJLF4ZmVyyZC5U0833HcI4JT7Zfpjj/jXdyt05hJ0FBQWpuceOl9BZ8rGQWIN
	S2rvFmAwPplMkbyKYyzszkN8cMRbD8CzkLtnnUBrNf3l7FaYIvKs7VpDzdtZR8A9
	jmO+pQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ctyqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:13:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4ecd1ae4so42873485a.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782810835; x=1783415635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=;
        b=WkqZiYXoot60CmKgV/5VTXRxdYZ/Ee4oYkpVvmKYK/YqonJY3aTyWrDQLX9eTrhnEl
         oQgN5Y+FH5/Zj35/Oo+mG0INbqhFPFz6fjXwu90mgSsbbKe187Q4TXjimTIHyhzOuRKj
         MMyuB0JB6S7FwEn547UIC86LlXC7IEpzdBMPFgrzoBo17i2z13g/0DCWuQULqBVPCkU2
         yC9sMfSqe8jQagu/zwSx57ahP20M/h5LBnSHD5Y1VxaP7Tm9UyM4YVuvCNL34nYuM5ru
         r2hVH1ndiA9QZ20jXG+gxvBbNwVYThoyexe907P/JZKnKhHbJOttmGwzibgMFHV0uDe1
         Nb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810835; x=1783415635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=;
        b=BaTv/4m5H8JhsMx5hXXOYwzWn+vx8Zm9RjiOiRTqmcCwKtCLh1hEukzC2TL/u9y2Ok
         8VOcDYI+tSl5LK4drL1leH9rpxOAC1hfqKR1tikYAkszaa/Rk58lxbTWUVtAtbWgj9bb
         wZGCGMkHc+my7xZI8X22YiXQfUYDGGr3wZfzC1nKPQKLv98fUXaqjxnpoXzu4TU/Osjm
         quJc1kHhyoiZHIysNfXcYotIC0LmmcQ0T/3/SC1TqKkg2xlNHPPJBsMrBvUrv6pd3oMr
         ZQirseuwY48tG59TXtxdf05KrvMRs4dx8Oyc9YU8+krKnI21s5Cm6DFubyemZVp7jYO3
         9Gjg==
X-Forwarded-Encrypted: i=1; AFNElJ/41OPFj4NhMnkkX7M6lvoZZ9xg9TLTryfsL5GNzV7ZYjrH8G2034KH0lfSaN/V3lJzUu6UWpzW6Qmx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc/hg5HU0hjLXsTQN0OTlpDIUqa5itk/TZODDHO4Z0hRMaAC7f
	ctf4zuWJHDh6iSP7616KtsWcA+8j2VKfmtYhLHr+KoMslwlOwsVk6DjsTyFPbtGMnQGRRDdLz8y
	3glj3zpFjkQhCjsy9a61m5TIr7YTfEVMHX9X8FXyMglLv6yZgTZRPkohAyXrJKhZH
X-Gm-Gg: AfdE7ck6aWWMoxh6IzwbD0LqYOsqYZ5bjO5u8Qcdn1Rw6TmUtIdibJWT9UQJnGXU2ct
	CRyuS4LxHrB5Elw0Cb5Zv4FORfa/iwezkFJYXKg+JztT3F9GUaitJGRRMFG577nsB7GRrnd0vzW
	BAvqiWuFwJsM8sQ126pR1VEEVcMIsf9OA7t6+4ZgVXQwLq/5yYmudbBKMrJ+/WbAW5HIEBAvYRo
	KrhYMYSFNCNUyKyWGEuSsxSa2JOgwjx3fG9trbYJvs6SFxDvgI9LfXJQZh4EyymE5c5O3pCdKI8
	DfOog5rO2WHrPIGwi1/SuxRxd7UI/hH3qQSQ0AzNhKtPweWpwOB4LWW9tCQOiDr6zDzJRiTBBpH
	nsiHQjL/nU55V/7Uw1PcftFeHxah7jikfT7I=
X-Received: by 2002:a05:620a:2b4e:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e622c0c59mr284172685a.0.1782810834548;
        Tue, 30 Jun 2026 02:13:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e622c0c59mr284170685a.0.1782810834107;
        Tue, 30 Jun 2026 02:13:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d16b06sm91084266b.8.2026.06.30.02.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:13:53 -0700 (PDT)
Message-ID: <62ce45b8-5ffc-47e5-8424-f1472a2fddb3@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:13:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX3ey2MYYBgSr3
 4RKjeb8vspi6xCB2N2yRYe6ysVxuk8/PIySAH3jcT6kgaHScsGbvvHcjvHf63kOtvzFj38qKjVO
 cTK6yMT8D6rKS+41vUrUSl8Fs1KuNWCAZUou6yTjWK8ahiWEJTgk79CezlRwc8xD4MAdtbHrPS1
 o+6Xb9CXrJ7/575gNCPdVh34EzcEvQLa9NoBq5M53K77Rg/7N5Zj+UiVrf7joElWvGUSvvmKrNy
 x6sHTgKqtBSqLfd+23AI+t4XJznxtjufH/1AY4RJ9ctu7FcVI9rptaJSYKQY2xfVtstNqC+tiTk
 iIaOGeKRiO6xGcCZIlX7UbKEvTSbE58yM1tt10m4BpnzmoY2+YAvbtIGEerYuAphQX2bvqoOJLu
 bfZlEhtLYq0fKRe5L93qTW+iobyWaBX/T0szUqh3EfbbmJTlmgeDIYbvJHqpp4brt++N70+4a5e
 u2FtBo/rZCUtlpz5dVg==
X-Proofpoint-ORIG-GUID: w9Um0Jf_dCx9TfAjcNyNL-Aovx8lSX7D
X-Proofpoint-GUID: w9Um0Jf_dCx9TfAjcNyNL-Aovx8lSX7D
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a4388d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S8WVJQRO9DNrYap-pUMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX4wyh6+n8AQcl
 IoosnxOHSfCejrq6oVzO0yN9c8WhX94ZrxZkz2ic6wqAHxccxXvjIlGdsB65E1/oMFmNWrDGWIN
 1ctClkZ3kz98hbtvFlBjZU4fSQX2QSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300082

On 6/29/26 2:17 PM, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> The jpeg-encoder node is described as a child node of the CAMSS block
> and is probed automatically via of_platform_populate() in camss_probe().
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> media: qcom: jpeg: restore JPEG_ENCODE_H1V1 for CAPTURE format lookup
> 
> V4L2_PIX_FMT_JPEG must remain in jpeg_encode_fmt[] with JPEG_ENCODE_H1V1
> so that jpeg_get_encode_fmt() and jpeg_get_memory_fmt() resolve correctly
> for the Write Engine (CAPTURE queue) path.
> 
> The corresponding jpeg_mcu_blocks[H1V1] entry is also restored.
> 
> V4L2_PIX_FMT_JPEG is not present in jpeg_src_formats[] so it cannot be
> set as a SOURCE format by userspace.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> fixup! media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

I recommend "git config --global rebase.autoSquash true"

Konrad
