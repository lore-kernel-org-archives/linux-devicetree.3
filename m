Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7A415F1D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375429; cv=none; b=eIInc/XmOedHf5GI3Eyc5Gi2GTwL7inpIhqGNkkqEbBXB16ea7EoSAFhKu/yIL/Tc2ikvBX1BpsUlzHnoPEd8PVGWQMe+gCpE7k11MP+XwQkUmXcqwh87q50EJF1T0y8VvPtVUzGg6Zcv34Kr+Eao5TdZbRl6M3guyKv6WT0jEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375429; c=relaxed/simple;
	bh=eRoM30W2f/mkMP3RZm5HJq5vqvrB/xfVifW1riTwVCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHQOmC0Vm9K76vyxdD6PFFVb0Z2OHYNq2RO+dP4tvWy/+LX31wRRTccMIRcyhaiA9EC7AGpOqrXE3ihRJT+onXZlJFTKvZ4UcGUnLcQPcR43R/OI1OzRq9/4uKD+GQWLIr89JyMWGa/qG1Xtz/rUuWdUkprX2sfVumb5YxUdqgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnCphuks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUXMAMHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnCphuks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUXMAMHB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5k8pM797835
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=; b=dnCphuksf+hU9Etz
	AeeO5zYjFlhsxtEY6Y8JtTIE5adm7CDRzCah02uX7qHHDFKdCLG4gTsBucoa9L+y
	9p6lneLInvFbDGRiRn8IfcLK+joiDX2LpAEXNGpoE8IKZdi+3SW/ZrZ+WWF0P//N
	6665MtyN4JdRtE9mjTgYeyMVEB7tLluUa10Zotq457GW6kZ7toO5nnz59K+bq0W7
	YZMEB54DArginHHL6kUNlL+HWfTIzQKRfFQp18a4qaB+Tfi37RExClJLRIhzZggu
	7NOG3d/ZG169gAD0EI3Xya/5wQ/IRfd5dh2Pl6dozW+KCXZkzmN1GMkGVuC7xzfj
	BWZmuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnrn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:43:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso60477085a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375421; x=1789980221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=;
        b=FUXMAMHB4PWC9HWhoBKenH2VDNLXikZd/IjV5i6e0V9FJlhrdjCoEyrgdMfGPSg2T8
         HXwbBSG+QICYxxflJMmtcrJkcGdnZy1yN3wxsxkh/Mqib12tRTHVOlTfE5nR2HUqTRHt
         gV4eLMkddeJXb42vuGNEm7xKtCyNYPWYV3qUj7cKqNMWdXT5T53M3qRAnfZbBYzyBGE7
         8ldIYf3/dPZlNM4/U+C5edIn+mI5YerZdh+0t0dVCNpymNah+o2q6/l2UR8Ow8svOzDK
         1LZZxo/SmrAUMozjwHKgHTEqogeW9IAKA8Jg3x3OBkW6gbelC7e1GeUhvmwLoepHSIm6
         4VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375421; x=1789980221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=;
        b=dVxbK8Njce3sNjaiiZOcN+YQz6uh2Rt4Oak5G660M7zyo3LVctDAWmMA3keBFKLsy+
         inOH+2BXdc6MY1uV1IXnDeQwO4KNvk3iej17hgRcj/rZqCNoIjk/5QSUowvZqb0ntgxt
         56fpmNr1lHVWl9XQeID700ht4NC5UXdkrt2ErImhGp4xYUp+pj0padIb1ak2LleFRpY7
         ZynqNUpCoTJRky+YHL5wjObdQRNg74AHBpqx92f/6MZ9jTrBMiDmDiOvv6fVa0VoxdUn
         votoPaH+B3bJ2hKRtNV62O8EbFau6IsNqbGZ+PIgd6aeNobGCcId3k9MMnHEI61oBjQ1
         qJ5w==
X-Forwarded-Encrypted: i=1; AKwUvBxmbkRhLDmDMw3g8nUMk47CYFgMkWLIlN5k6sNhH2btTIAR/7oGWPCFOCzjGJzQOtcj1dCoDiC+VS56@vger.kernel.org
X-Gm-Message-State: AFuF++ltYzsIka1rc+OvO3879F+SNiV7G1TeJXfi1PH3aHkCb6lgXMxe
	bn5Vh4LMyLUBIBsLqUBGcCAHGAtoeZgMXcU6oOWMbpAUPZVUoSiIvY9pZkTJ+2T8UZloTldFG0g
	Q+GbCttditdl4+uuMbSR39H38/hfxfpu2cV7SjmN4cZQLnDySkVrPiCOEHKhmjoVs
X-Gm-Gg: AYBFou2KcIdjIamYI8HxqSAGL9lgOhKEaX/cdpp1Ov1WxVrOWbvrkouXTpTwSnBVTAn
	rzBgqPMhig4qOdA9pVLMTdjH+4MO2hRfhlFX83/TcFzACKoR0+8dFN4PIyGzj5OGMKvI5UQcXAK
	IRPU6KwTGOh18x0jGk6/R9zyhjeZSRBKp554BAJwtNqBLtA98cEjU1YPlbUMGuUw/HZCOLTo6ZF
	GY2K+3aSCY0PaRVZGQPp+OA8Xlei2YqvMXl1EqOoDF504ml/Pj9sF3yHdvpZMhbXPmQKKiUdi13
	3Sj5cu9+/Xv1a3ifw8QSBTiZTSVFr+PyYQ7UqP8OnQbVxqTPhjK/scY57aFDadv+xEzo81ixBRg
	fsPZnHrhXN54UAQd8oLv26A==
X-Received: by 2002:a05:620a:470a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93a294c35f6mr194986185a.0.1789375420663;
        Mon, 14 Sep 2026 01:43:40 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93a294c35f6mr194984585a.0.1789375420282;
        Mon, 14 Sep 2026 01:43:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead51sm389342766b.49.2026.09.14.01.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:43:39 -0700 (PDT)
Message-ID: <9e4e2e86-8699-4fc5-8737-a6bed1e54ce0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:43:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the
 camera privacy switch
To: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914081652.5935-1-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914081652.5935-1-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX3XHbQ7A3vVHb
 +mqUUDfC/kDagxxeTA+f7231YdmUzy/x9Ht/GwebdkKwVTlegmynINtpBYBcglVaWWiL17PBoZU
 aApbm49CblbfqF/mYTVCADUQeU5yym8g90HS1xnvp3nrl10otOrYVM8zJUlUPhduaNUctag+ypH
 D8eV4c7GWcLSlqJv+nQ5QSfXU/w0O4A353I2hUyfqSe48eOiiixqb8Vdbwxap7yQmmMAT650emp
 yXgfoomcI+yeid3PI1atAURt7ygsjQzzCk02p/nwacls98jtfJrlI5oFssVFCMkemNs9gs90C4d
 WstGYVFqK4j/nX8UaQ8+tFw6LhtQYVS5RN7mPOJz/cl914KgBFF6OjHv4+kOsAj2dG3+AJQjEm2
 6aUaqmWUnAom9Fc5sL5z+580vD6xYkj5N76/8A4e3nxMR1vftPWgald2LUAccc18tzQ7At1oWdh
 /unELmB9bBCxgCtHjyg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7b3bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=qN27Oiai8M4bhUiYl7kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX4zjvdzlPdncb
 6SKzwDvyn+of43KZm9RTjXi6BR+eEUolvznVxQ/7DN6M9WHkyboO4yuKNHjwL0Fws2tDEM/lA62
 5bdMM0EzssS+yd4SKE0cbYhHsgdMDYA=
X-Proofpoint-GUID: KUWSpB1VL0GI0TRV0rLrih9xdBVA9FJS
X-Proofpoint-ORIG-GUID: KUWSpB1VL0GI0TRV0rLrih9xdBVA9FJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140121

On 9/14/26 10:16 AM, Oleg Keri wrote:
> The laptop has a camera privacy switch on the side of the top case - a
> slider, not a mechanical cover over the lens, and it does nothing to the
> camera itself. TLMM gpio99 follows its position: high with the switch
> open, low with it engaged. Describe it as a gpio-keys switch so userspace
> can act on it.
> 
> SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
> camera privacy state, and it is what the Lenovo WMI camera driver and
> Dell's privacy driver report for the same kind of electronic switch on
> x86 machines, so use it here as well despite the name.
> 
> The embedded controller also raises event 0x29 whenever the switch
> moves, which makes it tempting to report it from the EC driver instead.
> That would be the wrong layer: the pin is a plain level that tracks the
> slider position and needs no EC transaction to read, and the EC event
> carries nothing the pin does not already say.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> index ecc8c34fb983..b5848991dffb 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> @@ -51,7 +51,7 @@ sleep_clk: sleep-clk {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		pinctrl-0 = <&hall_int_n_default>;
> +		pinctrl-0 = <&hall_int_n_default>, <&cam_privacy_default>;
>  		pinctrl-names = "default";
>  
>  		switch-lid {
> @@ -62,6 +62,13 @@ switch-lid {
>  			wakeup-source;
>  			wakeup-event-action = <EV_ACT_DEASSERTED>;
>  		};
> +
> +		switch-camera-privacy {
> +			label = "camera privacy switch";

nit: other DTs normally capitalize this

[...]

> +	cam_privacy_default: cam-privacy-default-state {
> +		pins = "gpio99";
> +		function = "gpio";
> +		bias-pull-up;
> +	};

And the pin entries are normally sorted by their GPIO index

Otherwise, this looks good!

Konrad
