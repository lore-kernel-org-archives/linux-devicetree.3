Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873608;
	b=fVntVbgrIae1XtL8HoP0PkQAj5T3LQUe24QozD8TFFw7TnwR+WuQ5ObuFA76DcuEXXdU
	 9eWxfD5SJA/ue/nz0Es3fMZeusDX5/Nw7X4kdNyscZmBjBDdHKUxRCOcgfAGW6Rxk35Qv
	 zYO/6KHinPZmhRwhpXIpP8E2koxwyc7VUkqiH9wXto8FcFtf9l7RDRAO0TkWHP1wxb1Vp
	 aKgQFYdzxz7MsagcHBijpL2VZrsnOvnurWxu/14A2tP4zmtjeDrYEHpoHDidZZ/hUZDTr
	 wdqUbswhm1PN5dNaG3QqTTVlEAbvey7W2jdFicokRAJNDh4h1I+ODsQ/O4M9N1FI7aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
	b=zQ5anFRXehoXWVND2xVOmD+yRtex6o7DGjsEXYQOQirnwEEoseqo0vkw1HQahjzpAD1f
	 2tzBzCidiMpUGJC1YeDLXs1Ke3HmnD5iSUPiULt7630R2ekEBIuOOzuE8Sj6JNzdPJh8K
	 t5YsvwZjdJYWESpb6Dz0unkftqVvRN749SG0OK39er/Sc5C/cy8zl/KYBE5LQ3mCSl1nW
	 Pdhretyp+2ePIPebkSSTikL/r7nFZn1ddOSFsZ2X+CpgUxYEXHzIxndF2O06i6LKu4pgh
	 vytSuJWC5SzcewBuVBhoLJs/gs0BHMW5iHmSFS0ehpkcAwBPIfXqkWzkZLItJaX3/5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzuY0UTP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XB0HEluk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52F606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F52F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzuY0UTP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XB0HEluk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITnAM1419243
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=II4oMIZXIZseKoWFPBpiiKbY
	u/bQ3hfax0bZOTdZzAY=; b=BzuY0UTPsXpIcDYUIWFB7cqZKWoCnVYCEgZeImyM
	PzYCB2tb0FwkIFcn+ypuT9LoV0IDzPU2o0EP1keZuWoeS9Msv0qxtHYosBrnnK8W
	NpLaU8DTAu5FZBWI9SimCCeBGiLfVA1CpAJ4lpy5EzzZhslAXWInCPtkf7QAS/JX
	eMKEAD4sQ9RbYnoWN/W1PY7nYKvpaB6lAkWLnYVKJt/MCKc7kdZ7oJKiAP6aZDGI
	Un0e4el8SaKlV9z91HlvedzWYDBenr54tHQQ/RIz0AyKEyeAaqJtJHun7vKaUq9r
	6/HAC1tSjWn2x9a5vhsapKJ/QonThOsUBCCUwHbhIQEXwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9sk65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:26:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so374746885a.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873606; x=1793478406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
        b=XB0HElukSAQb9I453tWYCko6V1s2cEh0j0dbRQ5drhyBPWCIL/QlrVTMl2OrUmgIGO
         OO0si73+q301F25Cvu1juekWiH9C65bkzd67hCTWqiktITV3RvhLp6S8NbhyXcC1ncMv
         2VLZ1nuH2UtJJafi8oO98MOQawtV2pDkvsP2ZjyQ5+C/zBMjecMf8JeS6UML5Jlmk9by
         Rlh30pg4WKd82G1OCO8jzOnnORrkHmLBv4OzEFwRzJsGx2hpwQXmitD1wrEQVGn56Ck5
         2j4/1auYf98CbEsJM+wI368zCag6JHiwPgNkrjKTQiKitcYkqZdy06qgDmqQPtldMkEi
         n63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873606; x=1793478406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
        b=RCTHRKRnyISdVrljpvo0R3NQLPe4R0kvGtVuwoty0e10xw1WW/MNRhqhtX+dYgTQxc
         9uoIhWDozmYk/ZeKQWgAWpbR92c33r0XxnmElZ8T0oFM/0QW/Dftc1wN8L0MdLj8K9hu
         iqt3oSUk938oPExwJwdloNrLQXKamchP/B0sPtV/01PaCMhKRZXfbfRSANgCCbLV4l/s
         HXxuWMXGqM+0/f59JFjjcKsM1IiGX0kxHmu8B9sfIk6Ws/09t40S4RfJNASX7IyO6gmM
         BgR5uf2VqxronsCXG6EAtcLDWc5E3YPswWseZo109nhN8zzih0OkpFeZlULOJutnKwAK
         /dOw==
X-Forwarded-Encrypted: i=1; AKwUvByxwP1c7mMX4Wic1A7YhSiC/99H8PsH4dj1vznu4A/zV5bsnR7/bJIr9JtbRA5dnq+4x63Vj9NGzpNo@vger.kernel.org
X-Gm-Message-State: AFq9FYLxTCMRBNnmeFO2a4WI/eHpiLNxGMK8Y8Tvk+zCrC6Mhwxc509g
	mTO+LqT3XcFXVAIzeNVmMe36MRddDvNNB3HR4K4DJejJBHr/rsf34cMXBM/1JtAFzbBRTdYoClN
	prBQGEnOstmTljSS5xejEEtX7zDDUVWul1oPeSsK1y2qyjRxZkij0NDXIG+yISdiQ
X-Gm-Gg: AYBFou14GmvcH056HLBF2/OtuEsaOQjlGsdtcQ68uHA18GnV4F2/g+CZRughIp5XaaH
	wdeCUXLHHb40zZ5RIO7RcUYzqkiYA/xQQF+J/BzS1JfGI42V9obHps2Y+Y7m4MIowO3LZkN3kD5
	5ZnBKHwm8eBaFxOsMFzP3v6xo8oh6vXvUTQ5c9SlEsly0Imx5KepaNdHxq9REn80r5NG6lLjcc8
	UbdzaAycGXZxJarM/GkmNj+Cz8oz+XqgjlkkCcbDaIlBvzAxgPOVPBUJMUUQl3T8iTWqYU9TPIA
	/Ac8gpO3+5LOZmtMur+9sES6C820CXcxrzTCQuyCHTg91Gf+wTMmeKWKZpbIF5iTtJ1yvocbtiZ
	UAvv9SfrACwva5nPi
X-Received: by 2002:a05:620a:370d:b0:93e:95ce:53c7 with SMTP id af79cd13be357-940ef79f0ebmr406265785a.4.1792873606130;
        Sat, 24 Oct 2026 13:26:46 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93e:95ce:53c7 with SMTP id af79cd13be357-940ef79f0ebmr406263385a.4.1792873605562;
        Sat, 24 Oct 2026 13:26:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm205760225e9.1.2026.10.24.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:26:44 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:26:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
 playback support
Message-ID: <5ayekw74yegk5upaj7d6v2va6p4koy4yljlqje5cfgrhh7ovmi@akurrock3aed>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Proofpoint-GUID: 93LSB9qyFVc7y377wE31VDQn8sDE2H3r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX/igFDuwP2Eu3
 iCz1QwrF3APMca67HZWrZHgIm/pAVf6JyDsDrATn1SuxIxrdc4baF/Hkt8wsRdw2ENsmeRbJXnH
 odfHii9q7mBSdBMkviwPVF5JT/6mw9Iakg/YLxVAUt/kzZ1fSLaPFcGsC6nYsF7WxjAME5x1sG/
 H7a8vhdCE9Jd4wnLjobWPNPbBIzSVLCDNeGsP80bcVKjjyg6HN7xubm3VgzYbetoy1fFHI4hAYx
 i0Du/6hYE11JquEHnCOwG302x0yy2N7EYU9RFT0uVvEXtmvEy9oz8pZmQex7Wt4fUdFRFxIozjE
 VJXTi09ocpn+dCQAgBZHAhLwGD8n6oEt5VbfbHg8Avrifi/PqLvkTf9p0R3In7zwFOhltlDqXUD
 m996mlx+QoyFW+7BgUbt7Nej/g7Pgoqae+nDfzQbgKs/Rx6TXrjkeQh8Swpr7GVxfqZx2CETc6J
 DapPk0e7jiQlT+flajg==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6add1487 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 93LSB9qyFVc7y377wE31VDQn8sDE2H3r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX8VT+eGkxlocY
 4bWCPj3KRXQxt36ajJ19UuvSBqoJlMZSFMDaOgaDXK3F+BppVc8wEa+8uUkmgtaf10KCAdfApXz
 e5012zdCL65WlnLajty/ve6YQjSDMiQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:25, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
