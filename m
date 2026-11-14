Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625769;
	b=jPDscZtsRGw7kPcZF56HvinOqSndQzYvx2cYq/CjIyuHqSy5MO6wYJfuYfLTVV5DQJri
	 2GPR7ptuf/fiHUaqggg/KZEiOf4LDM//5A2jiscke8FxBZ92uN7RJ7tXHYhDlE+5uHgZR
	 kbFHmSDv6uc0J41G+/K7RkXHX88y+3qduVlFmf32JByn1Idz2364FYRUMDEgHjP+sQaDh
	 YFm9G0kpRjZDFvyDHM7a52i9QCNxG58Zj/8VibTznAO1Q6rGaYVMZVT+fEcaLXHYS8vJA
	 K8/q3x/qQxnLuSXvFDpHZPvpRzRvyd4E/gefjV7TaYmltSNdZIiPtUvZ+XGtreuYyOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sq435F/wJA+E0xSa4XwelO5DXysz3c6ASxv95R7h0Ok=;
	b=HAEx8Wn2e8Yc3S/8MkyXV3URuUNXdcwiIDj2/gQWguAGEz/hIQSM4lh20bkHHC8SGct8
	 vsd6oinOKmXxI4/c1WhrNxQxKFFPLQ+I4KWKmBWRt1QHepZAjJBdWn0H8nsGgIRurjU9x
	 GduKGJNlDvctyv2ycoEvXSMFWxiLurQz6+d3wBEw2JnV2uOYpmn9UPtwKgnDb6wdSWU9Q
	 MmNEwsKHqU9KnNJl8NUSqe9RhnwKlNPYWaHtFX6LV9BLI2l1T0jjpTS0dLLfmLgtt648h
	 WIkhfs4z5fjUKf5t5GPqpF4ceL3wjJPpnz8tzznXF+JXQBO/97FIhAQKeENzHCJYR6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNEI6wkj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAmzCx+M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA5E606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA5E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNEI6wkj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAmzCx+M
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE202v4728457
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sq435F/wJA+E0xSa4XwelO
	5DXysz3c6ASxv95R7h0Ok=; b=JNEI6wkj3Uxk0NHEp8eV/ayvTGMTP4JXMTtVTS
	J+3F0yoIbmadlefyxo3tHsfupk/hxy0yQA824nVwwO/EBsClkLbsE5tNgSVdJilg
	jL5McbUKJWnOUgPAcjm5CgJU7KQoGACAhGRYtyPghyawAix37GdBT1tSdi94IrrZ
	7yMEU+/e5PgxKQiSix9AkPNVdcF63bnllkvuKHNu/h/yO59yNHyaYs+h+xDicNTg
	Qc+q8hnun4RpjnFg0Wi4vpPOPbOT/6nEUFRE2XeutPVN9WP0hYdwh670yiJQkXEI
	G/B84YSJg56+s8Ea+naR1Gmha0owo8l61wib/AuyqucO6q+g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nrcbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c58d35c0aso266623eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625765; x=1795230565; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sq435F/wJA+E0xSa4XwelO5DXysz3c6ASxv95R7h0Ok=;
        b=bAmzCx+MpT2muoOP+XXwg+QRkvxjFPoRMzDVW1YU5YGjpT4E50kLjH8g2q8ZeV824e
         H041eO/gKTEWMBM4V/sszt0V3F7XQEdgeoCtzm0xABxJGE+wUgaT7t9uVdTYnM4T/ebR
         Z5B03v0XiVXiL0vIfXblhGqgQ3cpAWRe7Wc1kGHpI8XBWTeDSmSb9GEogfVYXXfldgnt
         9QRYQxtLvri5DFJJYS1abYIi5ms5ppXPw2xo1NHLiQ2+2iyI2XbfNCwFK6noRQTr/CPG
         DPFZFwcZpTFc4l25hnBS2HzTNz6FCTEkA0M2UApBHzY/AXVsE3H/iROtpmrer7cdqIHu
         /nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625765; x=1795230565;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sq435F/wJA+E0xSa4XwelO5DXysz3c6ASxv95R7h0Ok=;
        b=CwiGl9QoAeHXHCNACqIvHruWPljz07VkLvGsJFKYL3yAlCWs+Fd8y9z2FwqoICzAEY
         pcJ6G4Nu30gOB7IPqnjqYwJaNASH1UXnPJQ9G9aBZqDJQElMYgCA1XL31Z2OSKj4370q
         5x3gwfBZg4seMSp+xvGAX5wOsdshyR2Vp1Ll7ejButnS7lSN3V/xZsQUuvu8C1B0ew2d
         mBtlgUioTepDGqxQa3Yz9r46FnlA5EeWOZI2XhZvr3C5wTi7GRn8EOfTSnSXDVc4nm3w
         ac9zA+5Gn1Eg1VREU7zb41cLf5TKTTMb2eU8ZNlOWvfnZlsZJQvqh20Jxp9IZ3bNZZ/E
         fSUQ==
X-Forwarded-Encrypted: i=1; AL+hErHrPAeIUmNNT6+jFgCP/LSl+8pKhEtnYfMGpJR6Kepdj7c/tDarL/QprCNi9xEC4i2pYn+l9aOwu89A@vger.kernel.org
X-Gm-Message-State: APuU4Z9TEjVSBL05/3RZ3OeygP1Io2iFNd4CkygjcGVJqj2Y01E3ZNq7
	oD/FvNAcfxqh4UWOfhaYR323/w+a8Vx+iZHYJiI1iwre44igFJ+k3rbIQ2ea1fGBEJo5tQiBnQd
	Fu1mMmoxacJBOEjhZ2+chxGnywL1Yp6bIvXrOKAtWDrnJAprhXuCdyKSiGj5rrABKEelaSEEC
X-Gm-Gg: AYBFou2gcUOWTNMqUEn54i1l6g0geG+jIDkBtXGdugGI8liYxCP7oZwyIeEsnl5Yas/
	TNivXp3oZ952YCym4N41VDobHqVHaiMRsk4lO/8B41DXj3JZ1AtJgGSfnPQX8LOD8YzodrS1ngq
	AfrtpJjxuEBYewstv0W5M1kTXpggCL/EApdfy58SvM4FoCtUMdDQXr5zB6PglsKMY4o6dgoIZev
	UuLvdQUG4DSGE1HAZ2NUpH+GDJUJoS5c289iM2d0+U5XezJgMu/88jztMXJv/fi2lb4VsBKdl8Y
	gYOu14j89sW/4TqQhls0PPKfloL3BK0/KBhk6471AP/Yi7M7McuTBZg4EUPGQoK4hLJFFvMGta4
	vjhTblQ3rvtE+A98RmzwM7A2OE9Pmzh/9EE1GXzz0OvG+4sq/pom83Yh5TLyW5x7aQKXe/DNdY8
	ZmpDoczhX3hbTr/v/ZaOW1UD5/l7Z657Jj
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr7729424eec.2.1794625765402;
        Fri, 13 Nov 2026 19:09:25 -0800 (PST)
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr7729361eec.2.1794625764809;
        Fri, 13 Nov 2026 19:09:24 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:24 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH 0/3] media: iris: Add support for mahua platform
Date: Fri, 13 Nov 2026 19:09:21 -0800
Message-Id: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHQ92oC/yWN7YrCMBBFX6Xk90YyafqRIovvISLTZKKBpl0zV
 nYR331T/XPh3GHOfQqmHInFUD1FpkfkuMwF4KsS7orzhWT0hYVWugWAWia8rniOOfKZZhwnkj3
 V5YgGlTGi/P1kCvH37TyePpzpthb1/VOKRMz4Vg/VfjMrC528TH9pzfIBIJUk5frRWTCd0YeFe
 XdbcXJLSrsS39vMiExya+J9qJS3Xvkx6OC9C6HpG+tbXZNVDrvaGdUY3bUE4vR6/QNIQdsd9AA
 AAA==
X-Change-ID: 20261113-mahua_iris_enable-8e3026a4a044
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=6751;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=UAOFohLlAkRJuqkvMW5XFSaAlnCozqr7GdnVJY9icxc=;
 b=zkbeDYPgxbBkyW5xkZl8hgzC1THjGS/Ld89+GZfcCumOoTWUtOekkgRDbY6NZ7KWAmCANcJBy
 McX3o/WwIwwDa8uvK8d/NcK/P+/J9hDfjYiMtqdh6LzIkYvo6eC/QNY
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfXzys2nd08MKVk
 aii9naDoyGthVGSoysKHg7/VREcCYrl17Lvvrl89G0tEES+5aw6UCmcEMDg/HamN5F2Gjzw5THc
 nf2N+i9c8Ad0CzoQTTimVQQRhD1NIEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfXzz+0RhALajSx
 SKRGZORteIq2DwwnNTP/1z88vn1R9bg2Qh7seRjSG5NU53rmge/GpG+Quwezm9O+DsWlh14EJTB
 ZdVcz07RdT1Wh4l9YflOlR41hQiv3MnT4CcxTSS2uMr9/7THJ4jq6UfrP8Atxenn62EfMYia6Zy
 s23Wg08vmeesqWWtNQOJfJejNN0FpI/hSld2cOkte8R7x/83HJ3VYjNiXS/eO2p477rBJFVfMN4
 KzOe6ONXIvj7/pUefmDtOu9r+Akwx5VDMPE63wbAtvWig01hOrbfkSkfhUMMsln4NCkfmHJoi9C
 unj1M4LhMAZvhYFepEvqB/dBtai53jBqW06kfKnS6JKVH6fCG3ZLqVd7IsyP2R//+VTVOrcWNo5
 5fGCTTKRGEfdix824ljOtTyR5LzJGsbGscmkGZZGNg75yWgb3wRDqEIJvPjwPNGMIxe33Ns6VqG
 4qgbxzLnzLRAUfRWfyw==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7d0e6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NmW7APauWtKYNL66ANAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: UfLiNXFDnceAmt5ZD--k9iYPYrzTglEP
X-Proofpoint-GUID: UfLiNXFDnceAmt5ZD--k9iYPYrzTglEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140012

Mahua is a derivative of glymur video accelerator with single core.
As Mahua is inherited from glymur, this series introduces necessary dtsi overides
to enable only single core. Mahua platform data is added in iris driver to enable 
qcom,mahua-iris.

Compliance test for iris_driver device /dev/video16:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : plat:aa00000.video-codec:dec
        Driver version   : 7.3.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video16 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
                warn: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(2223): Cannot test DMABUF, specify --expbuf-device
        test DMABUF (select): OK (Not Supported)

Total for iris_driver device /dev/video16: 55, Succeeded: 55, Failed: 0, Warnings: 1

Fluster test report:

77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
141/147 tests passed while testing JCT-VC-HEVC_V1 with GStreamer-H.265-V4L2-Gst1.0
234/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
200/242 tests passed while tesing AV1-TEST-VECTORS -d GStreamer-AV1-V4L2-Gst1.0

Dependencies: 
https://lore.kernel.org/linux-media/20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com/
Changes were made locally to test as the series is dependent on Glymur series
Patch is created with base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1 
to avoid conflicts.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (3):
      dt-bindings: media: qcom,mahua-iris: Add Mahua video codec
      arm64: dts: qcom: mahua: add iris video codec node
      media: iris: add mahua platform data and enable qcom,mahua-iris

 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  66 ++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_mahua.c |  44 ++++
 .../media/platform/qcom/iris/iris_platform_mahua.h |  14 ++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  34 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  10 +
 9 files changed, 417 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20261113-mahua_iris_enable-8e3026a4a044
prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

