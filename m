Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491300;
	b=xOvKwiG22QTPlRxKigFv6pkTA56LSMyE2P9DYEgUeIG5isfm3hs40JfXDc+mxzpSELVs
	 RfQ6PtkDUOt48tmJU2nn46ybClzmVUPWynE5U7GCSUIg16YUBbPY7KpolF81IadkLL3Oy
	 x6rPv9GVCNnd8jOJdsiafLQV7QtExDF3FQ12KrvM54AuF8Uett/maMFtQkxQqch0D4+md
	 63LdSeF6sbARaV1LguUYONdLIgPCTcmc+2jFiqomR/D32vgfFPlSzHrVBeIow21+Z3MnY
	 nUWcO7YvgS1vnUJ3xJ4BjzyFvbUQCsaOSUoEuRaKBFMkXOzMtfIcYGlGlXhIgQ5d7pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
	b=p7mE4fV2cEGeGRY6dAjR/Lqe10ec9Lpuq1SGcD9lsQrxLDAvBnyOQMKD2HTpwkLZ6z9d
	 7EaLHTVR3JL45SPGk6LgquzaXOfcLEMC+qcHvfzJzq9T+EqvMRv01AsbhLR9A8pfpGGPD
	 /bO0FiTMrFm/MEEZA1YkCPOW+r3Od3orZZkRnMrhVWG78h/ceWduY7g1uAgIqQ6hmomfT
	 bsMNt6k/bofXHyoArQv4EOcdGVbnOmOLveTUbk1WMKduOm4o0jhwNr5H+Xo5e5fpjnHBj
	 GRa/xitxoM0OwthbspRIOE7tk5z0kkEtSAJvLlYBdlChXKiShHm2HrPbaTzbtrWHndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cspKiUEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HUcFsqG0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E01606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E01606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cspKiUEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HUcFsqG0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Chhg186498
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=; b=cspKiUEIS7Jz+WsG
	CL+hXvcNojI0UMBfCjMQzCzUOpF615gZAyQtaFg3vCuSoJLgvyr0RTx4s2U8Ai+I
	snCerdWYAQVqIIWay+IZcgq6dDMTl4TNOIL9LxJEklqTSXp0RXJxIHmN+PktyP7V
	ULw9cweFsISL2SjDcvYAuObRE3kADq42fGFLWrXKO1D59uHimup6yasFvpOsDaAG
	7WbjHWJ3HvxT+xfSvEZ+lnU6m8rMuCwy8ohXLTcanZI7NY6XxSFGY3S+m2abOJbx
	Uj+xBUOL88pJegolTad3D7sVwC5G8U87QzMouRBNCg3GHG1Ko8WykMeQU+VbpoD9
	bXp0sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nt15p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:14:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so45990485a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491299; x=1793096099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
        b=HUcFsqG0qNlMmd89CavZCHBIRivguWI/hGES2joNfqm3YL5PekhTEOmDQivg6BYrGO
         Aj9MS+pltxDPq870KjEc/4toGdmXSICrM2zvirwTJX7pI6nOVjbHgQ6usOA+ES9vXN6q
         MuAl88600SvFJZ/8uOpUCEGuIKfycO6QCYXGLDDhPAo7egsddEJ2djWyMxoCtydb/7xy
         dZZG3xGkA8s+QpcpfCewJeYfUfRalXmp25EgHFwpWlgSPOP5+RMxYN/2LKms0d9OiEZs
         aa8SnSxgVWpP2CPHfXx2L7rsCNTZ9+XRPgbk0qL7ceB2kfjdkDy7nykGrXwzJ5mpRGW8
         W3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491299; x=1793096099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
        b=SwUmezeXxDP04LQ0M4LGZzIDbfL0Uu61PBCirSsWYc4LckEWfDxGHgu7CUFlns8xGl
         wOsprsx59T0L73J6LafYZibZjcnVoNmaX9SmDT+tFsuPU8zpcDnn6kDSAOaxDzJHKbkJ
         +y/JrGanVUU1Si+ZABnxZ8/V6Apvt21XDYkKM/DK9yH6if67ZW95eKkmv6/+JE4oF35G
         aDeRwIo8JbNRLH7/ItQbkXdE2weiu2IxYorf/6rkakTaC6NwSRSqYdnfdfgVNBm0cvpK
         O7bph0CDDYnSlxjvy1ngT1tCuZICm27lUAq7KOtiy8HGvFqbha8uB2/FTHd1YJZdlBbN
         JrSQ==
X-Forwarded-Encrypted: i=1; AKwUvByPopKKvvKhEGbzusVVYYRDsTGYVhkCcGtRVX/Yk/xR1QfVx3LrmVgTEde6L+d8p4HgfyloEwlNAEER@vger.kernel.org
X-Gm-Message-State: AFq9FYKu9XJCzgPIGgtFEOw/2csBzGkGJxM9hOoIE24EVrKWHMxXV5RM
	vk5IW0DVtIX4RN9yzXEdpPOYi/uLbLf7NBDOp4AWfCwr0HNhCC7tHpuc8Zu95AWmFlbOU8nXgx9
	tTTidTp9E+CkgCBf6WdhFGBVlscJCvgqtZtKVjKvAWWwner3B629KiMdzkvRgn5aU
X-Gm-Gg: AYBFou2H8N88y9n6Tb3OpYZumxmtptlZn0Y5AA92jcXP45xhm5t+ZsSCG115ki4+8XG
	eZ4bx47USlsSfDGK9SawWDRo0rCXcOg4H23tr6TK2Zk5vjHh7XpsJFfV8J/Z70SVynfzyVyBrKy
	a4120Af5KJ1KGQbsw4OvAQ7jQ54N/EFCHgZ2OV4zgUB05n80OT/luHV2usBUA8nPiek5T+oBQVq
	jBcSjydEu9opR0e3nVN0C+CnaDLGsc/vRN29dhtacnFotOf7v4DCVNgfDsKDaCVSjG2ULkgb3O6
	7DIr3eoND1LJkp8y6wNGpy2HunTTVSbF/7WKo4fYlJWqKQtRIB3JX5b66T+ttqBpNvFUId1rUOK
	oFNFySwLQhsNalAyxXCM3+Q==
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1729941785a.5.1792491298797;
        Tue, 20 Oct 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1729937585a.5.1792491298279;
        Tue, 20 Oct 2026 03:14:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c5e36sm5247373a12.17.2026.10.20.03.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:14:57 -0700 (PDT)
Message-ID: <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:14:55 +0200
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oUlQhXlezyF1UizWRXpt-wUQZwNq3dCu
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad73f23 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hFpWyfsUHjvwOGgMCfsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oUlQhXlezyF1UizWRXpt-wUQZwNq3dCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfXx0MevoBgZBK2
 CoNx3U0IDbhFmwjOPG9YLnR5Jg83FHY3WoAVLtml88OH80VRx9Cfs2pu/mCeqjJmsedaeRBHXFS
 IptxVhpZc5eHZZONcz1uJ9puuTt8U5Ddurev5kbWVbxuR5jPIRmSEApBm/tymPPJhskrd2Bwmya
 01y2h5f3kEc2S8iMwabRuLVT8Eqzfo7tGeAiShM11kQdrcfTlsd8R1jeVoG07acAomE+4bZHZ+6
 +Y9fFpJy0FENaYM9WeE3lcBq+lW+IC5Wi9npKcAqPFshSp8zv+P+BMQ8+BOJNrRffDTD3BPzlgq
 VUQIl13HtAKyT2V8/RzyZ6tJ+fant+Zrzi4WJb9IRUs2Mjy8hcQcNsAPN5dh9jFLrOzb1hUnw0E
 2DhAFKclM/2N2T0MYhCKbMLglQxRAhlA/oHupGgBXUvxsmavFRgGQeOO4vHPq3qybUdU/2juv97
 RLu+PUZOZNz74QxpcAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX/QvJqZW3m59K
 PVlavOAvRs/9KrVf43wKYUjpDa7enfKiL0AikE1xo4AIxIAZGcFeI4Uj0Pfd9OsS4Nm4gTSVKyW
 4hnUaIZY0vy8SJu7Jv4W/5zhlNIOb48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On 10/9/26 5:04 AM, Le Qi wrote:
> The DP2 DAI link is missing from the sound card definition, preventing
> audio playback over the third DisplayPort interface.
> 
> Add the required codec, CPU, and platform DAI configuration to enable
> audio playback over DP2.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index a811d8ca2dbf..93cefffd1f46 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -641,6 +641,22 @@ platform {
>  				sound-dai = <&q6apm>;
>  			};
>  		};
> +
> +		dp2-dai-link {
> +			link-name = "DP2 Playback";
> +
> +			codec {
> +				sound-dai = <&mdss_dp2>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};

Srini, can/should this be in the SoC DT?

Konrad
