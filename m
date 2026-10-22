Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659428;
	b=AfMDHjwJM/y3Dd0tykDNlibmdsYIjrqkqyr7G4RHI9aedsoUJjRr6S8l+6tder76OHk7
	 N4fmoB+RRLtdjMg7CfOX3qujcRMxAgwwVsXgtbr0mVVDfbj7Nz2+wgegzXQ+ga7jKJla+
	 PpPCyVdPFhOYi1lh/hVOM+UgmKthBpDz2Qebr6hWXN2ZGCYTaGWfrj+NyOiPxA5HRbK2Y
	 gNhKt4xZwY3ASdvZQkXtp1rZMlIOIVgZP63lwrPJM936UApkV2GN33OrvhXIF3i9F8NC3
	 zc6djCcS+ssi7NxMQibQPKXCIMFl9jEXqzbbciVdvgPjPqEA+ijQwjwmHymb9BN2aAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=;
	b=iEK8CRo10rTclwXBU25SxdZzPjAI+LNK4ar/wbUasGYz9RBLe2ijMmIUYK6/M/ocjfyf
	 CcPp9YIzQzqsV5zXAf+t8CQv5JiV1/UUrlRWhL0d2eODaMcxzvWIyg55i24p7YSi66030
	 uuaMe01hkVyNd++/CivyuYN5LYCzWzi2RegQKVjgrjtupOZ4gQiv0ywLTdQrXANqjudg/
	 j1AU9gImXZvr6Ut/MI6XjPV8yVH9CnoLIM9SiVwwQMf4vyAV4qWgbMC/gC+HSgfaZkFiF
	 3AxPzjKm+IcflhIrM7uvLkqDQMX3oLYuTrM9AVB8jJZ2YyBspQJWnPvXSQXTYsPIboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRpieIV1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OVV5ulCf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C183606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C183606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRpieIV1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OVV5ulCf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705EL4110618
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=; b=bRpieIV17snTgK+Y
	KDIYl0oz9t7EL/mW9RsvV7+NTfDG4iMBKhg98VzkgIZ35xGjE+xD+5O884Axxv1/
	92VgF/N+5FOFHStDJ4oKbJ72I+fvFfWAFORUcO6eRQUkyhasomPolLrBFl/Jyylc
	qTQ0NFvHCPlIGw8HdZqy21JdfW4qNpT1zI2vdopKiUnaDBNoU8pYk7yiLEsxRt87
	WBfwj+ICpDvfL3JxaU5ysIGiJUg2YVCdENYQZNh5MV+aE5Anv5AnpveuX+EZ8Wnx
	6R16ulRBuUrihZgoiJwQGqFYX60XmBq094ymaZ0bY8Rv5uf34xgSCKof9PIR+5Pi
	qTGVug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahk4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:57:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so43625185a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659426; x=1793264226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=;
        b=OVV5ulCfsZIB+RZaf/lzDKlN+BHcgO5uGySm7x/CVLwlTN7bMEbOXq+1irzCoWI9p8
         nZ38r8Xi+D7OfIU2a3jVBqaEtiOIzZ0d6MKuaFlvS7Nu6Y0rXP4uQ750L2kJAjGNbJeB
         +Gj0kotuuHH54yDyiu+L/ULKx6nUbnA3RnvqT/2o6Gsi88K6WkUj7ilcReg1GvQIbdfH
         x/70uADHn9BDFURR2A/Vfno/CS6mYKkemM3gXSypTY7NxN10PhPNwIucPR1PQQohqRZF
         0acKR09Hja0itcZ3Rk/+kHA16cdlwJ3r73d3eoCo5kqWqr7xrFeIyCll5+ZkznsAjN0j
         edYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659426; x=1793264226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=;
        b=A1QZVdVrmdUWy3a7WBN4c9LtQPngIX7wIwBq63h6+XWiFuYxEyy6aQfALk2fMknPvX
         oL3NZYM+UL88EN58wwbMjH/3SEwOHJgarAGaXaoDGkKsNVXgOrM6l6J2BL9fT6QUfYdC
         7vcjxI37wmTeH+MxZmO2xGB+Xi9eNBblL/1eD4S0afDjnydmsU0yAd7JNftMQe4YjR8R
         u4eFoBsNYbX3LGpOtr4Da74YNv90bwxlQW3F5ZfPP9Vpx+0TSRqRE1bF/TO28Nzm/2D1
         FMrFnnnnM7zk9nRoMECJD9TsVR5zVbo9cM/iUf+oBleOINnI0l5tWLL8V8lSgfEdiEgW
         TLzw==
X-Forwarded-Encrypted: i=1; AKwUvBxaSor3fCk3dIcA/FNGsDd1XMGUU6GzO/lHwq2ChJJxc0mN3n6qyBIGhaa7FdI4k/BeUuxlS0b+zg9F@vger.kernel.org
X-Gm-Message-State: AFq9FYJSNue4lELkQr0evZ7HMRWx0DWmqHJUSbcq9g78brH6XeFt4uEV
	3Wu15+E0GayHh3yxAVoyHdF9KVwR3jwutjXEsoMhk8phUa50KzaGq1VNwRGbghHJ8jE+8cPtkew
	Du9SyQW+CfF2BHnEw/9s6drTJ+5/Mt4LQVg6mJaUvGX1lMRy8izUIq2Nmoqpzjb31
X-Gm-Gg: AYBFou3jy/u51aKMkcFwsUwIzxPUyYBG/Bs4nUTk8Bj7eEb42XP/ktSGHr+Whu4Q7dR
	JHeZ5/VcHyCKGLXTfYKQzY/fwG+4GP+hb5zXne7eQ/JPxqVCrCjPnVqmK9HORdL6A4QA3A9wGXc
	jURiO9gj02uOlL72sK+DOfNVdG0cRhSaFS4pN9LOBw8MVAwyOV/cvjFQiMk632DcmnfKj39KCCy
	pX1dziwGMdigvQSn//Vg895oaPYS/S6v9c8A8pCwJMtuehe3ZrSIenUYv4itG1+BwbLbI97vdGV
	+gzMhfg2Mo2c/BHm8Z7GXi9ebKZHGJ1v4B2NkqmalK/iE0h7v9bpwzpisqqvTQKcFzv+6UMGdTU
	cGac3MCb7Yh0hOz8ImcWQew==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr993622685a.1.1792659425798;
        Thu, 22 Oct 2026 01:57:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr993618785a.1.1792659425257;
        Thu, 22 Oct 2026 01:57:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e1ff3sm84664666b.71.2026.10.22.01.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:57:04 -0700 (PDT)
Message-ID: <083629da-9f30-433b-99bf-c39664ae7ed2@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:56:57 +0200
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
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: hawi-mtp: enable audio playback
 and capture
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXy3hRQCQrFQ8B
 GcKtyEmA5stuzn3ntqkAcsvq2CZF9jt7NZiq/Xet209jJ0A1dJkcGjTmaEiogFNYftk5rjEY6uv
 aiHuatXNMwZQRC/rOEDqyLnisUNEiCByO2yexc13v6JCekS7kNGB4/gscobXCRrv9mVb4Ostk3J
 avjimzaI5EzUmUasDAruuOWlIuEj0skcuIPWUjxT6GFEMBJaaw2U3e9eoPcCXqKwd4DVVozL8Cg
 rgZC09Qx7WnLqPwErn9HomzJTRgUuX7faj+gfxw1amLXWa+DsGNyviaiZLrCmZtw80YXwEzhq0e
 twC4N5XYyaBEb0on0OftuEWBqMh+rCa5URCYKxBXSOVglUDi8TMkruDOqtBOW41jopQ0S24VFLa
 pSNIlTS+9HlN2gLcZ0vfNI2PFW+HEReajcME8s2okZ9eOYJKK+Lw5cahtTTrkR2tw6G0TDFkJ42
 FESVoG9tKU5ZFMOF1fQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9cfe2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MgFaegZgclKnZZk0PtQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: YAYDN59_iUr8CdqKX86G_Peod54D9VNV
X-Proofpoint-GUID: YAYDN59_iUr8CdqKX86G_Peod54D9VNV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX9LWqfCHydX6E
 +1On0xwnqLSOF0umeI8c3S2LzWc1zBHwEbC3nZWme6lAEyfzuMns5jZVeKFIQgCZ2JQFdI3Pskj
 dw6ZAzoHvGF8KBTkTLZE27G51DMPN5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 9/23/26 10:46 AM, Prasad Kumpatla wrote:
> Wire up the audio use cases on the Hawi MTP board on top of the LPASS
> nodes added to the SoC dtsi.
> 
> Add the sound card (qcom,hawi-sndcard) with the TDM playback, WCD
> playback/capture and VA DMIC capture DAI links and the associated audio
> routing. Describe the WCD9395 codec, enable the RX and TX SoundWire
> controllers with their WCD RX/TX satellite ports, and add the WSA8855
> speaker amplifier on i2c3. Configure the VA macro DMIC supply and the
> required TLMM pin states (WCD reset, WSA IRQ, WSA shutdown).
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

[...]

> +	wcd939x: audio-codec {

Nodes should be sorted by their node name in absence of a better
key (like the unit address), please move this one up


> +&i2c3 {
> +	status = "okay";
> +
> +	wsa885x: speaker@c {
> +		compatible = "qcom,wsa8855";
> +		reg = <0x0c>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&wsa885x_spkr_sd_n &wsa885x_irq_gpio>;
> +		pinctrl-names = "default";
> +
> +		powerdown-gpios = <&pmh0110_f_e0_gpios 11 GPIO_ACTIVE_LOW>;
> +
> +		vdd-1p8-supply = <&vreg_l2g_1p8>;
> +		vdd-io-supply = <&vreg_l1g_1p2>;
> +
> +		qcom,battery-config = "1s";
> +
> +		#sound-dai-cells = <0>;
> +
> +		status = "okay";

No one disabled it, so it's enabled by default

> +	};
> +};
> +
> +&swr1 {
> +	status = "okay";
> +	wcd_rx: codec@0,4 {

Please add a \n above

[...]

> @@ -937,6 +1129,20 @@ &tlmm {
>  			       <119 2>, /* SoCCP */
>  			       <144 2>; /* CXM UART */
>  
> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio161";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	wsa885x_irq_gpio: wsa885x-irq-state {
> +		pins = "gpio77";

Please keep the entries sorted by their gpio index

Konrad
