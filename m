Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542551;
	b=p6n1Mhs80d44DQ1HcL4fk1MlhnUVx/+qklPX5ArDyqllgtxNGa+mkr5pYEf4DxrOqexC
	 aVGJ8lR+rarIosca073e6tZJ6zYLfUKssjPB8s3TdvnAxZuVFUR7qYl4zAOsTzOjHzV+Y
	 a7unAFrrHDxagfxhSFuXmltWyjiKePxyRO3bIGYe4UO53aXxlgw+Gkcc4oUVgK3+5CD5I
	 ORVn4zq+rGfwTAqabFQMdaWAu/9cCzh6gfkaRlBH8gsJJXuDXoHEBLVl7sFI478ykVW4t
	 mLGWid3TZ81+Ptuvvt0psVfh6OftrE4fZ/L7+LuD6PkeIohLoBNPf4zo8rVlWsDjFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=POpfJK4+Ds84ziNJmqrh8bTeJhFMlY0kf77NTrQGQPw=;
	b=KtN1FCvGB/Tkc8OIlIo2/J5yqB6/SFD6utPjQzGioMx4bHIMBWcqZcw5YKeTl/btsZWr
	 w31U6m6GjrUf07+36hyGRflNcwp5O9SO0F5esKCglZxFqaO65Wv72lVg3RtgwhZB8yp0K
	 fY8qOm2qXDtQk4R6JVSCtvE/hk4f5ddVSTBzifjcRXqiu4x4yHhwqOIyFzcsxuTVTFTYP
	 87gnqqyoLwuwfRUJlGWmLTdC2A0QrMOs6XI0uKlvBYAfwb/dvgjp8xTo4KeIjXHoPnAvY
	 fcUl/DITDhmR/eRhh449/GPapiATmycm7NL1E7ed+1/iH0TKrE+lVsNbhqnrExQ3aFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fvprcw4n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4nMRM6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0384F606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0384F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fvprcw4n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4nMRM6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL2Ub1183782
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=POpfJK4+Ds84ziNJmqrh8b
	TeJhFMlY0kf77NTrQGQPw=; b=Fvprcw4n8FQXr2lkkwPwPPlEj8n5X4VXDSzsI5
	4tgC4G+Twv90AGGvKQXKrFij/xE8PgYUx2Dmw59cYyFDhzbzQNWYFn40LqIymgEZ
	Kw7urCICJ+PQ1Ed4QxT2s1WrOzDeuyg+QkPEvHBE0A4XiZXOMCpU00Ef5Q59ucog
	ZLJwupxW6V0Yi8aD/q9OEjxGPmgl7J5co28LneALbG2HkXVH7m1Pr/9PNTrSAxZx
	iWzdHDjnZJN22flQlWKfuAjywR7caLwaFV1PHpoNmS8EzNCoc/Dw40gP9lmF8LWa
	gmAnjxYe5iSe9FQyflh8KLR9hPX+J2H7vL4kCKdRp8DYOjfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky42w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:49:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495af07676so754406485a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542548; x=1796147348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=POpfJK4+Ds84ziNJmqrh8bTeJhFMlY0kf77NTrQGQPw=;
        b=BH4nMRM6/1ghNQB9BrnDibJGeDeQaIf4xp7c7TxaLID7gX2hc16Fg76vBbGU2o0m1d
         /EpeliAIJcOOIbAlfQycWYoqRhY5gtGhbOYngBQi/a04DK7taXk9zg9Dp0df9YQcT9Af
         pV8rtWKiTYEOl33i6j2q3C2f2DSSie2yesYWYNJ3ZhRNyF9/+VK7V2/DpO/9sg0v+wJ5
         NUYBogXN4+oDskMGUeeGK6d5ZrxCXIEiNxSzOf/yHEZ9dHujvM+AKIFGgQ/zTTSOON1F
         HQtms95jPaPV0WD/vEkECziMbOphBW0Vp1gSZ1eJHysnd+5+FlZf61OsaRp33dfrOyig
         eahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542548; x=1796147348;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=POpfJK4+Ds84ziNJmqrh8bTeJhFMlY0kf77NTrQGQPw=;
        b=NuSbPTS06AACySf2VWt6aPprpJm7WU1hVFTGYY48VNAb7VK6F4qCuBTIJ3rM0vOIFC
         2AKF2wU4RTRSCooIDAk0EQKnMU5Hx2JS4DnVrC249la+A4InW6BNlq3CZ9QU7g7SqiDF
         1oc+R75Zoo+ykDJryhe1mYYGWiu+t+QhzszxvK1H4WiZvsP3KDbMTAmjuGVWzCmbk4pU
         B87pPsB+n0p4g3oK9932Fx9dVfwYMG1yDt5PGyyNRi2hT6nIbrry0PzX6czUukkltUlu
         JRo1Q+rVyYwXTx/gtOBHMLwpIDK9wqbwCkB8HxATVX+kBxPShYQnvfChuDZctZNYXSib
         mLbA==
X-Forwarded-Encrypted: i=1; AL+hErEmP2Dewb0hr9s1ME1MWlYgOT+Y3BKgm8rinV5bdw9z0mcBK5wG8s4V4fr03bXeD4BFwuK1CFQQPtZu@vger.kernel.org
X-Gm-Message-State: APuU4Z8+Jfqv5d6tWAzvVn3R+EKmIOjJPKgLruvYr36/0yqw8Ih7o+QW
	PPQqJx/YY8k54ZTkY1GpdFzQvTd+EwLqNl4vj/XSO3u1ZL3jyF2znpGrFx4/K6yzpMmjJgUgIcU
	AkACArhG5A+fPUgwjdBJ3VxOiYJyoIQIyTuwN9Zrbgs9VJ46I0iXH/Px5mlssekDt
X-Gm-Gg: AZFdTZcjNVTUxfxeNh5HoPGBd2Q4D5S+wIMbKZjbXEjKttNMoehY+nQMu9YKgWp7v4E
	hpf8GNFETEu8M1z+bV9nf5Fc0q8I6Ow3LRPPXZ8qeNkynKww5gBf3bXrlvnM6K+gUboWRG35S/w
	mv/9ZMgFyRpdH7rb2r/1ItI3i5hlAATso3u6+196T4ZxRXUigVAYIiIwlRP4KuODW7g8fG3/XXC
	ZhSe2gkvMET+5isBXnvORaD9aH0ngSJ8VuTR8Cb1h5GsBITjzy9P0e+/toSquyDLHXYlZOJwx0e
	R7PuejiyYazrFlM+7oa241zrj2kwCwtMa2sZX6VtlxgGOQzVGW5ZIuiNZi5Y9RbcfOPAXJG3daF
	2fPRDv8B3Kh3qDookWltda98K+0s3F29V8PxKLaU+kd5QsR74kMGR4rEXE7rjEA1WyYia+VOmHg
	al6lovu0Ir4lpH
X-Received: by 2002:a05:620a:4611:b0:93e:4d74:68fd with SMTP id af79cd13be357-949baa0b126mr2720163885a.65.1795542547980;
        Tue, 24 Nov 2026 09:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:4611:b0:93e:4d74:68fd with SMTP id af79cd13be357-949baa0b126mr2720157685a.65.1795542547480;
        Tue, 24 Nov 2026 09:49:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: QCM2290: add the Embedded USB
 Debugger
Date: Tue, 24 Nov 2026 18:48:50 +0100
Message-Id: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3cLkXCMjSwPd1NIU3ZSSYt0UM2MDQ3PDNIPkxCQloK6CotS0zAq
 widGxtbUAOaWZ6WEAAAA=
X-Change-ID: 20261124-qcm2290-eud-dts-d630171f0cab
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05ce15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_DArt4jzgbN4o2ndQLMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KXb_-ONa36UhUCuiw_d8DV8l-qZQoGSK
X-Proofpoint-ORIG-GUID: KXb_-ONa36UhUCuiw_d8DV8l-qZQoGSK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfXxLLrFYc0HVn9
 gTMsL6JIqZ2kVYJ1IefxrCY/ov2Eg0BgdZQ2i6uEopsetg2t4jbpV/1KZzv6kNyHsvP2kENb5wS
 Tg7oxprQP0p3TFlmu9XYkZp+NHpSrJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX+2QYaL5gTOk8
 oleWEd12IGb6uSgfWu2PM8ACD9olcYnFXTLG+oJveidX3FwmknO/yrrW5h01yRO6biBIM4sEjHd
 0qOA3ZGmkz78RuU82H/6XTkigl/uo2bIn44YEsg6Nfq4Ak9SfG7C0Sv0pB2rbRTPQS2y3U7uJDE
 ySfXXz6RpG3mS15YXv665h+wPrLzIChEcm7hazFjmMnZvEdlIAICYsR+owjVoLLYHOGWi68DSUt
 ZTp2q7+oOcC9rYZnbjZVxilnxXvgN/5qq46U3iZDKFJDu911+8FqvA2ivFZvtLsrKtgg6oU0vcD
 XFIXZKjVFBOoZnNCvlvZBvWwIi+XSo3nIIVClASQTDAM/lmsYBr91vBlVEn8iGd//C6GL5YPFOZ
 Xa0Yzhm6psvpfTFayTDVWDoNNVixG/Isl/wXeIwfJ6EJvHrPJLfFa1E6S0wZrL1kzXNuTcpzfyz
 Zqz04+r9Jxtgrfi1RwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

Describe the Embedded USB Debugger of the QCM2290 and enable it on the
Arduino UNO Q.

These are patches 2/5, 4/5 and 5/5 of the v2 EUD series: the binding
(the "qcom,qcm2290-eud" compatible and the "qcom,tcsr-reg" property) and
the DTS, split from the USB driver patches as Krzysztof asked. The
driver change that writes the register named by "qcom,tcsr-reg" is in
the series "usb: misc: qcom_eud: add the QCM2290 Embedded USB
Debugger", v3 [1].

Testing is described in that series' cover letter: Arduino UNO Q, with
TF-A and with stock QTEE, the host enumerates the EUD and OpenOCD
attaches over SWD.

dt_binding_check and dtbs_check (qrb2210-arduino-imola, qrb2210-rb1)
are clean.

[1] https://lore.kernel.org/r/20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com

---
Changes in v3:
- Split by subsystem (Krzysztof): the binding and the DTS patches form
  this series, the USB driver patches are a separate one.
- Collected Reviewed-by tags from Krzysztof (patch 1) and Abel (patches
  2 and 3). No patch changed from v2, so no tags were dropped.
- Link to v2: https://lore.kernel.org/r/20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com

Changes in v2, from the Sashiko review of v1:
- Binding, dtsi: the TCSR register is no longer a third reg entry of
  the EUD node. It is a "qcom,tcsr-reg" phandle + offset to the TCSR
  syscon, which already covers it.
- Link to v1: https://lore.kernel.org/r/20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com

---
Igor Opaniuk (3):
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 34 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 +++
 3 files changed, 62 insertions(+), 1 deletion(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261124-qcm2290-eud-dts-d630171f0cab

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

