Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002525;
	b=EbFg6+ZXj+NuNcxDUfCqj+PgWm8Ii29F/OjuL5JNQcdWeRXGOAnndZEOdIR7fVy6W2J8
	 qLGMUroBoCO9VQjf84BoOQcjOXCOCFV+m2HguTNokjJSGKfW+OK/7a5XcQE5EwOZCpW4q
	 0ST9VXx2REDHwK9q8ulX1jul0mypKAv3k2yutTo9VQ9oM8W1i2AqkxkfP47ZXE303Inc2
	 rthO1aTqDfFmO6ZPDMF86sS7xXUPyY3Shp6VS7oVyPEiYz412KN4pOTjNOwcYzkn/Mqkw
	 61mZvW/DZFfrfvteZV5lvqfNxfYgXJfwzAH7feoR1CBdqXtT/MoUTf58vi5jqm5ETjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
	b=uu0ABR9s0CccNXlfWu4NVxZXqJJINRlJvxzPRXZ2TPQ0Nu++ABi0l+Tq95aab9O8ANBx
	 8dLp7zGIkvLyOsp7HZKvtQPIWM1nFvvEeoMH+aLPyOi5Ix73HngOlpXfkgvePFD8Q2J8T
	 BEUBEyB9Hb8R98cmb4tuSxbfXLUezD1EUBH5jDDSgRQM3+K6gpgoOm77PLwYrqmzIMsQn
	 Jq6HnTFePZ3C3p1RUuW6ZYhblhKu+Z6zNEkYVQkxn1ktEFgDtIe9IvACe3MIlx9bPWqWv
	 cN83g6LZiDYhR7p6yTD0BSEvS272XuXP4PfK/3XPSlEdwxpPdQqHnw57xhhj6f9phFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0L4edZR;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb9Ev+QF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87FC606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 22:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87FC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0L4edZR;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb9Ev+QF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JLTYY1263149
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 22:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7yEuGiHrl8v2KO1Qgqcvsz
	xhl27VpOHCTIq8+dICIGk=; b=i0L4edZR3i/ni09UBm5ll8dGWzoybXYNQLNY5V
	vvjWK1712HYivGRWMj2Cr0tQQOVbdsYWGpi9Ro8Sdx9Q+FzOA2IjcGre3pVEBvTN
	yKxbUZv/autEtk4P/XkFKPl7FkisApPEC8XEpZrsTOt8wKXrO3w4owjazw5HnVbU
	qbIhobFg3jsbQNh+rZmmCm+y5+jU0SFsOvy6+0UAtJYIz1lvMWNWtwLCeyBOJdbc
	B56m5Ok1h2o6OM73xtAi9rK+Nfr1nZh+627PEGtr+WKjYbqUp5WYGNFVC0TnUtjW
	5L7Qgr0ZTEr58tCvpNvXtTcvtM9Fcvz+bRvSTkj8mgqCHo5Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmywrgm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 22:02:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf45382794so1024679137.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002523; x=1794607323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
        b=cb9Ev+QF3A3U18mKZ9b8pMXoOzWDMSDM7qKajSNWixIqxQEvVigNNqodq1IgEGPFjF
         ou0zLWFZyG1lZh8YadUaNgorBNdceTCEVO9/bAiFn5vb740e76kqOS8rUz1cLxtOOPIv
         /H7YhGlt0JNHJkfaS3xLnWc/ejbmiptitqbytPa4r3dt/EsLyHUt8qdQSNypIK0d8voI
         B2kXcOl3xIKEEt7WsN8r2ROHQBa17LenG1OJGnzm9ged61p4O+eTkc72tZubEN3oWIl8
         zgIdAiLlRq0arosfmqiRO/7P7VIiQaPVqs++d/fxm7sqmcRevNGxV9zDkoh4vWOyluk+
         v+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002523; x=1794607323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7yEuGiHrl8v2KO1Qgqcvszxhl27VpOHCTIq8+dICIGk=;
        b=tw6JIoBBRdZ3M4/KCLXwjddXJQiq7Aofu5hdziaVlMEhKGAj5lYjjr9PhjpEJOF9DN
         5aZCtGsB84CN8v39RhjVXjhOqejurKDw4UC9jG+lwbDMCSZ3Vv1t7OMjXTYfAuCDaW+s
         phoE9GXeY+T8yXyboRxrH7GupRt3AHhpE2h+MnWIOqGvXdrIgudaHWm7/qNBElqEnU9c
         YHQzIBlEkfbx4hm0PRHTivtYtJz7LetAzuba3Hoy/vNplT+hJRJh7C58Dv/S2jQ+H8NA
         u8OEZdO2WksziZoITr5/6LDl7akC5pmUUUirjcE3LoyZF/4jcPmfl/3evs9fyqBc1De7
         MPiw==
X-Gm-Message-State: APuU4Z8SkL6Id7IHpNQoe73zSj5w2VxSCa/zLua86tGutmaN/jzpUZXI
	fm+SKkMVtMp41Hlgvfpd1tKgX/ua8CU8fpQWNN2hyD/8ETcjfPxmuD0jTCGwE94iEpLZbLJx7SE
	+gSmzI0gdAGBB/f5R4Vk95pE/LaSZf0WcppXrdBOt+ynTaBpA7/QYBFjciKW72mvj
X-Gm-Gg: AYBFou3kvdvDN7ZDj4NMhRT/XguU+do2e5GqdgInJ9RI5vAUHCmFThsoCJ3gCMJ3VNj
	BMEfoGipYpMcFkvReomrfxWs5lW8cyJSRT32KVDHyt9kgRZkEKs1OqLA0YuNxFoQ31FidOgDboD
	efbaG+2MSUZ1S36hBtxs6ATNNEIsU+2P+8DprSIj+6BpC+sLPV4w65wagok0sWwufPlylnl90IY
	nJgn3jE0vecevy4x0u5d/Ef318YE4yizmZjCi1R9PsmbmdoZ2Ad0GZE+VA9Am+VCl5azrHFjVBG
	VAGDxKEXzCyz96zisCxtKh7pYCrIIjyNCqbHWbB7/9ia+aGCcDrDjyeS38A2Jxhclm7eiIgxH8v
	WZiIxtS0fYRq/D/o1bSVlf/Gm6ZCUpY4dGuA7wIxJ0j5zJf9KP1d9MECBAg==
X-Received: by 2002:a05:6102:32d1:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d2a12f2ea3mr2331142137.1.1794002522605;
        Fri, 06 Nov 2026 14:02:02 -0800 (PST)
X-Received: by 2002:a05:6102:32d1:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d2a12f2ea3mr2331120137.1.1794002521849;
        Fri, 06 Nov 2026 14:02:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] platform: arm64: lenovo-thinkpad-t14s: Add support for
 the Gen 7 EC
Date: Sat, 07 Nov 2026 00:01:51 +0200
Message-Id: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAE9O7moC/yXMTQ5AMBBA4avIrE3S1l+4ilhQg7Eo6SAScXfF8
 lu8d4GQZxKoogs8HSy8uAAdR2Cn1o2E3AeDUSbXWuW46VRwJFcgWTRlkZVJ17dqsBCS1dPA57e
 rm9+ydzPZ7X3AfT9++Z90cAAAAA==
X-Change-ID: 20261106-t14s-gen7-ec-297593bda0fc
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=X8BfmvpE8W7+B2t4IJID/uS+mnVleh2clOpF9Xw2obo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5UdDjlMhFo+w5WSKkPrkrk+l7CpPlWADNeq
 I1iEjXex7+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVAAKCRAbX0TJAJUV
 VhWdEACS/USlBGnUt5PP9IL9TAcO6sJr1IknBqkK0SmE1IfcRgn8wxVxGGncBrEUKS4ITqqP3Db
 5lvEwB9dLa5Z8Ww1rTDriz/D7YdFoftjvKfJwFtHzZieZkgKahhUAIcm617g1AdHU9kILP3PzVL
 JgnEAi6Cs/G19V8njZ9oNJX1agC7gfijJqGkg8GQDVRpc0RfmBG33ZOlEd7jmcRQegM2dhTdaJ4
 5/qt/9bNQ1Cr06rMGwnVGsha0JUpNeAD2YKejDR9ZIUAk0lZgIMNysCqU8K3/WgwUOD1QPm3f7M
 AODyrwLhcpCIzN9mGWyIFJEP2/PJyALm0xz1TNr5R1/hsVlcrKW1UoxSpWFCXrD+IMkQdozcpbL
 1wMGHZUvKrRTW/A0L4HhkdGj96UIrUWd0BACPZiSOrFnxfZAvMh5Ub6OuZaczAHiGXpC55HWiT5
 rOIflvDFpXWVuqMwEoJDTEv5noN1VviR7pO3KapCuyR2J9gPpRl1RReuFs3tFIPWgLlWEr+JIZx
 joX+wrHb3Uc9FPTtHHvIV+a26zJF02NPSjo9b/qWvzU/zHA6GDPZ5MYCusVYmW585pHUl2OE7ff
 6alck/OwziocUisB479c5SwqeCFlKgcXC658z9DhGRIkBmk+0K+n2CsgO159oANrnXLx9nWLMY6
 GB8xlh5XYYFBUEg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=A6j5rKWG c=1 sm=1 tr=0 ts=6aee4e5b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7rjXLmKk895soiuU5V0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfXxlPlEh7VND6q
 1Au8zoLR7flea/4GJ2eERfGx+ES75JNwLxAN5B1yYnvMjWinEWxqVCPLI+pNarqPNghtesZnrVf
 kSld3ZbPp0U7o3e22YmgDRIsQR8LMqpjzkP5X5VV30+Uv6hd+aTHDFgKJ5LoBdbyuHIHZNENbhZ
 O4V6zjtDxhwRbjy9bsqpqtFOq7wrin/GtmNy0pf3Ph/xg5DmStCVBE72Vx9LNrbNQa5m1KmUzv2
 oIfhFsypDvHheMyseJydjwcuzWb/arhxJLLr/rvXNVZs0GvG6FjAVuYFP5NG1rn40TLiEiVzNnF
 Bckjozb2ymNJmy7Tozsv0LY6AW3PwhiiVBZWGc1AGXDD82wcKyyFOKXp3MQCN1+ezmgxL66FYkG
 lkj/KKJSUArUnNdVdJGAV8mr5WFmHEGGxOZZIqflDnpAzMNzwWkh9QeywJw7DhQvRgrERKbGb51
 Bx/y+QkmIhLKA7kfWaQ==
X-Proofpoint-GUID: Ruo8eVWYz0XuSBqQmfo_h1voCciwyU6h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX78172AhhmrfJ
 K/g53QGaN5WkwUhtzXRXToGNRUTV/ifEslSKJkke+a1blCJjsVu1tEZeBroMvVuxHF3GocSfnpl
 7Tt2DNcVEdpk5lHh8e5Zp4sI8qIyUUY=
X-Proofpoint-ORIG-GUID: Ruo8eVWYz0XuSBqQmfo_h1voCciwyU6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The Lenovo ThinkPad T14s Gen 7 (Snapdragon X2, Mahua) has an embedded
controller at the same I2C address as the Gen 6 one, with the same
register layout and event codes, but it speaks a different command
protocol over I2C. With the existing driver the EC never reports any
event and the LED and keyboard backlight writes have no effect.

The Gen 7 protocol is taken from the ACPI EC accessors in the Gen 7
firmware (RDEC, WREC and QEVT): reads, writes and event reads use the
0x80, 0x81 and 0x84 commands. The firmware also describes the EC
interrupt as edge triggered, active low.

Patch 1 adds a Gen 7 compatible to the binding, patch 2 adds the Gen 7
variant to the driver and patch 3 describes the EC on the T14s Gen 7.

Tested on a ThinkPad T14s Gen 7 (LCD): Fn+F4 reports KEY_MICMUTE, the
mic mute and lid logo LEDs (including the hardware blinking) and the
keyboard backlight work, and Fn+Space changes are reported through the
LED class.

Prepared with help from an LLM-based assistant.

---
Abel Vesa (3):
      dt-bindings: embedded-controller: lenovo,thinkpad-t14s-ec: Add Gen 7 support
      platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC support
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Describe the Embedded Controller

 .../lenovo,thinkpad-t14s-ec.yaml                   |   4 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  24 +++
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 176 +++++++++++++++++++--
 3 files changed, 193 insertions(+), 11 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-t14s-gen7-ec-297593bda0fc

Best regards,
--  

Abel

