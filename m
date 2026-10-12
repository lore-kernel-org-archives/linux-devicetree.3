Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB014A260D
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819074; cv=none; b=paWVb6k1LXiTtcWTUzgedbQl1/EMnKX9D/avGd500GvvXgVo7R7fl3sVkVwM2/nsvFeKu7Pv3PsA2fh2eDA5cQGrmjX1ociq4N98LcqSpWyeAmkyTEet0rBEUuz9DZqwtKf25e5+2P1Hz7h5r8TOI+7E6UBUoUvqV5jo1UGn7oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819074; c=relaxed/simple;
	bh=J/AWg2rO9t6Li0W4BRRLPjLIlRWnFxitTywIJjioLSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guBRusEYM6X1p35GucrmQo5i31CzX17hM1vsLh0+0BVGP4qzDafXZZZnxqyofNDVJsGs3r5C/Gv4/XIEMsDcP+NVHUUd+jC5B/nMUHnHJynl5wc3xpw37yhqfhCZtJ9XVlE22o9p6ks4YXzDdLWdQFIDoFTYo3+SS9C0OPs40Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eS0NZrAn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVi80F0V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eS0NZrAn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVi80F0V"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09Bk3292338
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=; b=eS0NZrAncxL7CP9E
	URE+uPb+lbqKEBKR12AQ7Fw5nIN+7hUtX9CjVZRyFDfMUXWNS+/vxbkGAtIJQtSI
	qo4gXMtJJmrRAUxLbNO/Yz8ubpXmaWDAMlnTnphwlJyws+0saGmPXDfObudXSIx9
	3hQ+Qbv7dxKfNp74qlfZNYcn00NODxKkvYvaIZPZIcRW37MVmOnAhejsMN1kYIXm
	+p1mVZErAFyIEfDMZnVJ9LQkhxD5r7fitKQN+AOENkZTMrEh4s/KYu7LFIZLo8Dj
	aeQWtI/wyGHmfSldgX1N4w7VEF3drN7/8+AEYlmBzEh6RNWAG+8wtpYJtoSU9icO
	RbnJfw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j2hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cba2460f8fso30433137.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819072; x=1792423872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=;
        b=CVi80F0VDETQJkE0QhjXY6YSmDzSM8JhsjqKdLf855mpVD7FChuoPPIb4EnE8OZBnq
         QWUr2nRv+jACCws3aAgIppsn1OyWavyVKF4Yc5XqNJDFaZQ3rrnYideh+PszMekr00KS
         WRkDr4iYIc4mUjhnNr23gfQ4K7cwyYBSYXYwTh86EkW86js6hc0zN6UhO+CrZ9lwCPy/
         d/gYCWnZJs57F/VR4aJttO4dW0ilY5mEMzXjIO7TlpvqB4l+Kou912NgF395iEhpclB7
         AzquWrYlUNf8SvcKYtu9vzbBYQUGEq8LicLTNp1WXBWFIvgSzvi70Yh+ttwy26XsJFX0
         uJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819072; x=1792423872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvYTY990Iqo8HQRDO2/ZvwfM4lR0mz/0Ay4o4IXYJEQ=;
        b=nuO+O/oiNU5jP/Ogt1gOcBqR/ysnmICS3EYjiwOSoX27iAzCWm9WSERthceRoXL6gg
         In0D8izjYKzvdutsqf/T54DGV7+iMLBlGo4tyIoTjN9TF4mJueuuZKlGNtHA91U3FtRR
         9utu2ppZyuiQkTVWEbMZHHKA1u+6PUZfJ6iBZDsgK3lKUyk7SsYfzv0ZfBfsVkBVHdZZ
         qqeE1y3kK41XsQRwTpJ8JBzQFysSnh6rFWrK74shD04BN4L55LpIJjPAWIv24jmCBeVz
         bzwcqF3IgBq1uJcaUGaNkxPI1ia2gyZuoNXD8if4jnII5X0cOevFydsCD9wVmc/lsbRY
         foew==
X-Forwarded-Encrypted: i=1; AKwUvByAJjWz3ribPicgbaTMgjCFgJmdwExVAk+EWcox9XhK790vNiSjGayMfCS7ayCGLErntWwGy1XVk6jD@vger.kernel.org
X-Gm-Message-State: AFq9FYLk1oaPpeHrXSOsKp69o8yTo/fClxo3DxOIXd1SDTA+G1yN5/am
	5dXKZCJGCDYLVJfnExk7hLJYlxOL10xCtZ2Nvycyx15PRt8vgmMumbe7Pm/Snv3+SSyJNrnLPbG
	WNJJ6MmcbDlO9XuMPuA6gN65ARraDkUCGjcYDLhouxVe6nwf9XFjIVAN98ipwzujc
X-Gm-Gg: AYBFou0QufJpjVsB2J6uznGA2ivpFAVLrZQQi68fe86ZSd1A4wjc3knB5KendH1eCQI
	uemB0kLM9QNt2xKI8h3t6P2lo+/MDHRT8uuHimgMCyDQqe/cEo+Ph2hWhX6E6B7BEn/E7jL24Sk
	WhjzL77iIWvYgKqsU1ApXSbmswOoxWhOJcWIyLgjf+UI04tg3M2OSZUBhx0P8cPFQRoE7qYfi8I
	IzVuzbs0sF2aLANC5rOTwvkXmCMuRPZZzwnhdCHgE2n64Um7SHLEs0KQ/wwT1PM62K7waT0Bpzp
	LKK0letN92Ku/MGAUFnO4o60+7N6AqjZtnFTEBCr2NeNMc5kKHkR771+hKE16lxf5WNAYkMlbNn
	SvV8XEjylFq4TbRN4NJNvAA==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1467538e0c.3.1791819066495;
        Mon, 12 Oct 2026 08:31:06 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1467403e0c.3.1791819065083;
        Mon, 12 Oct 2026 08:31:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm159103066b.51.2026.10.12.08.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:04 -0700 (PDT)
Message-ID: <4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property array
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX7sJmndTDvphS
 KkMnFCWHD2SIfEfHeP3SAHTSkbLigLc1ylla+bRB8V9es08M4HxA24XZYNc1g9dItldUutQFdaE
 U4ZNf/cvw1dBrTCrnd6R+kCZ8+6w0rc6O84xmbKcJ2DSeoeSWeLLdRLHJmXlsuGqoldRY0Vql1/
 wWZBmNBjDO/G6bi8H3awnGkcYV9xLIB05eqQoSN7ki97F4XKPsK4JyX+0UzxMrd3shotwRMWmqJ
 GgXitW8lGG4+rCqu8/Tpjopo60nqypJzQVyTsrqx9wcMAyQ498DBR243bmLrD6XIRRLmdHgityO
 g0GxcnTdj9O2wqeciM27KF6tySa2txUpJ4LYhHVAxtXGpJBFcNvULdCR8LDPKbue0bkQxldHcZ5
 7jA0AWYnjTHIolDpthJeaq7FIp6xFG/uBwqjB5/Y+0glps/lrXYgX664BDkrois2nPyVdI0aJpR
 uTQfpQkSBCEoGkl79FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX3Lx3nbg1aaGy
 fooMaXEZyGKwTGHr/PGSUPyOWkU2nddJh80xnBoeOf+OfXr91ucrbUlwEcGI0WnjplczfvvLjNj
 qv8FNStTThUyocvMMC1mdgznZXeX3UI=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfd40 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=3huqtpSITNoFkarYwggA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: WnMr5Icowz308yR0vaV7m8kQHctEr971
X-Proofpoint-GUID: WnMr5Icowz308yR0vaV7m8kQHctEr971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There is an awkward line break at the last elements expression. Put all
> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
> formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> index 24632af28d52e..d2b576a37c47d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> @@ -278,8 +278,9 @@ memory {
>  
>  	cpu-pmu {
>  		compatible = "qcom,krait-pmu";
> -		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
> -					  IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupts = <
> +			GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
> +		>;

Let's wrap it at 100 chars. For lines that overflow, I think we may
need some brainstorming from the wider audience.

For reference, we have a couple of very long lines in the Qualcomm
soundwire nodes (qcom,soundwire-vXXX), and we just kinda let them
overflow for the time being

Konrad
