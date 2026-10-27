Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100969;
	b=YMee4qozLqxcgFj5GeyBvNk6IgCgXXgpYnnZvyKnwsNVTBGUEfgjeAMts06XZn7ilBQw
	 bWm1NlnIrZWj52SQDddF+YJSW1/B3RKvXwuAIMtMvgP7ICDxOA8MKX7ZICWUqljr2i50o
	 33KzFk6abzBF1UEdLo8LHEeuWEzNmGelOtWr+nvQpKNttvrXb29TFMbmrEOktzVKCSPxN
	 d7rPYsEd3sJId1U4MElVMXhmAzt8XoRqV9S0tyaZyB2OVaJog4DwrtHyRZvH1eurgarOZ
	 iBW5bJ3YvpkI/IvEeTE+vJTOdR9mWYGKXurMyQoQXi0KZDsvhciGIvU13VQyJongF6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
	b=zIEq2NBTCcNl3i++a+28NkU/4q47D7Yu43coPVaMKwhZ6RQQC8HqZ/N44NlnH6Px9gRV
	 bMv40c8SSIft2I0LnIpHgh2D7jeSxX5lmtjHHw6sVptk6RNopeZf0aucb6jouOFNs8odW
	 wsLU1ft7nwd2+29vc0hDpUJiO96Nav/GSswHlUeUDIeh98FkTB7Q0w+U+lRtlefrkMTLC
	 jwcPskOtHPoOQHWPW2sJ962Qr+QBWWVSrFLu0xQRJI0jCpXm5yYazyJvmz7rnAk6wL5OR
	 FPY89LcZUVdE3KBMxFqBwAAIr5ZDOLvMLHPyRXrUExwsQlOFpCDNwFauudQW37ggyPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m5Of/TFa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6tmjqWW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC58606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m5Of/TFa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6tmjqWW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3O41935891
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=; b=m5Of/TFaHjpV/k/i
	sBMq7iQgK/8z5bGBKhxSYwsasXHfk84q5EBP/I7QjG4mM+PMz3hC2cNklSa8/YsF
	A90UqhCcVvcuLHP10dlzLfsPPrtc448UI/33qk5WGQAXtWxTMyOvvBDBgQdUEBCZ
	mv061gbRpFJQ+ZbH0CSYZfmY9reYEhLM/EJDT60frngj7YmHuNmr095TyLNei7u1
	8GJwVxSngHBESXq1wZDN078KvE2PMczT7NB+I3iiMzZLAIQN1MrSHdqAFPG78GSw
	f9y6ftPApYrrnwtw1xMjmroQu0dth4Hp4UOU5jx/jJ1odyI4PgKm/Vun+1wetoC+
	K+qeLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtm47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:36:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so120252785a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100967; x=1793705767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
        b=C6tmjqWW+H2999aoEoJ5EmAh8uz5UY+6SaVBGDDNLza2Hlwa61VGwFq0pXUuwHwyd+
         QuJ7rVyXxM6jlcDcA/eZI1S9pDlYnhKVCKOm3Rq8uMXO73JE6rPK8o/P2gG0bg7uCyqy
         SUvXAswdG9Z0DgN2xqn2IBdfaKI/MW3IMuZElJSKwfMWydIwC90E6f7qHQcTZOMAxnt5
         Ii7Q/01lnIWMbQNKqjCybOH0vA9rlpMYY7rsZ7B75rLJQ09ztaeR2FVv4fTPMoL/W96N
         Ysz9mbBkVyplGd81JFqxqTBlSVNv/UaRSCLZ+xmRU0IWkZKxbI69UlotchpdyAXcvifQ
         J7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100967; x=1793705767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz6qxFG/l/0Ek2++WnFgH0hNL5TIZC2rhICee3ZrDXg=;
        b=jFrZatfGek6hKtUq1YCzve+5w7oRjWQChnfl+CsboT7cRHcIDDU1QXMX1iUhjKRkER
         Sb+Tc3qiWjBhBFKIJpLJ11z7zpWveXR/f0GyQi632sOq3WAka25tL/qlDMo5bkZ9v1nf
         X/VrYD4tRF3xMSU5zh8TnEvBkUDRJxn+TQik+h7/o2k8bG6+mlKCJy9ZP1Z+cmI04P1t
         iILPC+eWSmCG0mACxqnm/4o0sAMKWeX+3qPcRwlpuUHXkIJ4a869K7z7X3ZQOgpkduu4
         iF1qSJKElTHO6dDfFcpnVLvtUh5qnrYl7hxTDmsvzWSokBpyDmKdSl/lxNEEtNHKXcDH
         0kfA==
X-Forwarded-Encrypted: i=1; AKwUvBxU698BT11pf7qfXE2TwIX18AQbptJPP2XVwi7Nn9OP57A4VsmcqnEUqZ3ms45LGB3n7ljNDujaq/v9@vger.kernel.org
X-Gm-Message-State: AFq9FYKYYFYuWo/aWGcYmQuAesRjQfxRy2dpiaOpfHRIqJGiz8VFDz7K
	lG3ySjwHZGAqMybIE99wysqGDKp12df5pDjcc35jLw5qc0qbXfZjo1lW8kKgS5rJpR9PXhCjrE8
	zxcAO5kFq7UZgihVRpD9RGB+GH7U/0kKrCVH+Qk//3+YGwftejbrYk4iYaQXuTTMX
X-Gm-Gg: AYBFou2hBEVXQk+AIq2goL1GhyO79HMPdNKBtqAbB0MBygGQq1foNIpW+CzKqEZLL45
	KZ69fJClsnhW7lKTMjXhWCqoLwGBsFLcw3jmLr6i6fYzu9gFk41mF/8xFKRqTSgIuQDHSffDQun
	Yxg6/tLBc1ZYh54skZ0jvbSdROkPRfG2Aeoks1KrX1OPfdIaQ6E307RdsTIj87QGBSSPHVN1jBS
	D1Kqbwn8d7Q+cDzmU//zqL69qfQgbWxiOSBzIZ4tgQ3OPiC3K23ScwX4PnYTOg4mjI2QMWpaVnB
	53LXt3LeQ+vRVObJdvxNJih9L2P07d5DHp8NfySJM1AyhLXMFmMb9/9WFQQ7lIbMnQ21p8ph5Z7
	D1RaAbUil+gsrmHY1d+eRwg==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1747741585a.4.1793100967109;
        Tue, 27 Oct 2026 04:36:07 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1747735385a.4.1793100966390;
        Tue, 27 Oct 2026 04:36:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm4956195a12.11.2026.10.27.04.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:36:04 -0700 (PDT)
Message-ID: <8d14b8ac-3f7a-43b9-9f7b-c37ad55c413c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:36:03 +0100
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
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VDzcgHgzf9vFY98hmGGT0yqD98mz2OQ5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX2FdZcMSwsq5V
 r+2PgDd8u600JPKyKWA+aBijBowy8PRwsoIklcKlg8khI7zm5Alv0sUrCkNxnOX0gyJtpeZvbby
 YCAz2oc12MhX1vQdrqX58U1YJSfVuP0=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08ca7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VDzcgHgzf9vFY98hmGGT0yqD98mz2OQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfXyExB/kKcJwju
 fE2QqXcSEFdBh5Dw4ggSrAPCJXodXmpd8sDt7t++MZK+DTfbQeq+kAz4TM83rfleyk1y+5uVqxs
 dh8lJnIS1pCdSBWrzJpJ5fSNw98udDwRgoyIm+zJ3Y54R3dID5DI4w4K71h22SyyYBUEhWN/2TO
 +HuAvfNsnL/pxxlmD45l/JZkzbKP+JFVCCbbfM4yuva/Mgj0TCd8gTLoodBY2kt3iMW5Bd6VzfC
 Xpwcj6DMYbRle+39V0iVe+lrXifUIWit8tq0oFDTcrLXuw7xKdG5iWonP6nZbggPUix0Y9iEl7P
 zAdkfZwKlqTQIAUWqF9Wu+CYG/W/tF6MJAa7+oXY5AZdaYDvys+RibWgaKYD44ks1S5D/s8C6rN
 rlN7UEiU5GOUXWRLFKsP8RcnJmREysSMvr+ixTKNs0RosWcCkNCj+Mn+nnnY1yDcbFFWbCwF671
 wuDOt3ZSJm+BAYlNs4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046

On 10/22/26 1:57 PM, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
