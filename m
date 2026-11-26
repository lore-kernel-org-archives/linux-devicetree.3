Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718299;
	b=kvOVMyjdUMorNj+K0wIjMaQVlJnHN901ao9MD4cHZTU4V4QahwWsp9IZda41jWCQdtah
	 E3pePnodADre4vFDfYlSPNnJcdSsXQWP97x5hE0xpUZP083prSiIBwje3/aI1N8czd3xE
	 rFwLEaIh4bktiQ3MIgBQgP4CZEmKL8t7qaBJmMGMztCmnnlrViJXQMj60RQZx9HJEGT+L
	 QzkwFkdw2NeUIHW+5eaIlS7n3wDAD6mckjI7uQwtCE9I9AygSqBVpsMHVERbVaCDWj2ym
	 J+8NkGW0Tg+3z7dOROG+udhd21E1EHmIlwLq4O4EnG21ENGuTsE1EspqQA/q++gDXqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
	b=kJzz9MlSEo/V8uTlJYzHXd/oHOfJoocCV3S0otiOlXxfyfkeF8ANF6yYb4nmEVtaIWdb
	 mFA9er6B7Hlbl5AcueOTJOlUncFWzKxCD0YZJ1yyMEzIASQda3tZzI4lAV88kBhyPkZLI
	 Kk3F8oh7HG61YLcZgSB+r5A29vNjknU2lM6JHAdaw7g/cP9fssUwpNSlkElkQdBdKhtTf
	 p61F8v9bv9i3SpxCj06Nc4QVVJ3JxfrV+gxTsFRU+MkqOn+xg9xAn7Tit8S89sJ44n6QK
	 AmZmD94WpEU+fXjsi7Y6Itqbrq17+kuOXZxKIkwg4Sj1DPYNan3W0GHcduMUw9zCXmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv4VTkli;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/ErBnnV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365D606A690
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5365D606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv4VTkli;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/ErBnnV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu9b53484266
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDn
	ELoPBjMQ=; b=fv4VTklixmFUYwjniiesSq2bKFQDtBm6qGnPZ0kLTT9SMCbGYKY
	XxTAz9lMVwCh93OEhZkifCNe6nrpP4/ITinitYC49C/15WYLwFtoPcTkNAbP0/AJ
	O+Z6E+7CKj/hBWT7qhWaSllGcxJB3k0hK4sYoa07fpgZYvQTGqP9ukfXdEbUxKgO
	3A2teacFHPSlZ/aUchNYmxvghLpJPN6oEe1txM9ANxyWcJuVFfXU7/g4EUDglMEp
	p2djehEwW8ng6UrA06hplwc0JcLIlFFfzii8i/sKf9lTOhZPuEqLSrH1JaUOTsbQ
	CulWx8D1NoBuBNRi4yay4eyqpCIN2eSuJAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak03f05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so1379325585a.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718297; x=1796323097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
        b=g/ErBnnVTkcCyRkKxXMIf/GIiDEiCRB5R9p2DVwZOnKR0Nf1ZdmqkrcJIKFI9bpiaz
         ZW50O0Yw2uWDnPjWZ/ZGpN+zP/bg6HADOW7oXa+4oPC/R0f7uUDncV+VVlACVF2+E6Z/
         6fxAvg3pTGeLXM1kogGl5rLvHtJuGUjrwgjcLRxvaE2tGHhjuDl2FpSV56qsrmZx0grv
         j4O5WiuVmP7AdGCZXXPRDsXeMVnpo6e5ReaKbRUY/4eTGFu/W9Sm80ndA3+/1yEFAnC0
         rLqDldkcjzjUdTfUEYhNv3togS44N4/PEmBmsY6NNOb5FDP+1sh9nO3oQ64AIMfdfq8j
         k7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718297; x=1796323097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
        b=mvkzxGLrpyon1cZvYgAM0O12Ver9PxKZ15w6NcThXUEnjVUtsfo4pFxWid9olSJk2j
         r1lQO6zqgMVYnbt/Jqyg7BYzkGFINs6pe/B/ykrNqUjnEIHBoqdl6zi6le3cChC7+JBy
         /ZTOo6SX4N32zNvR1t0vO9WxydA8HMSgBvxC56o6lQVMlWfOor9d1UUlGYj4Volpm0R8
         WpZG4uUedA0WpEVvOz40RnuXGZcOZArGsVa5kG0TLy9ndSBmi/5FjtYoq9cM47eJ4wps
         LhiMI+YrRlJjcwVGkULnmi444T429aKfWohO3dj95ILDlH3ydXAjpopYYdUTmh5DPfqU
         ZleQ==
X-Forwarded-Encrypted: i=1; AL+hErFDuupESHRwZXMvP9XnhdpIQkRRNNvPgnah0bEtutfXhfw4wH0MBs5sz1B9/9n0Nf127ChfcdaFXrXG@vger.kernel.org
X-Gm-Message-State: APuU4Z/x5a9ylrpIX9LRwvbb90q17N4BrdvcbmjIZL3vlA6Z4l1dZS3k
	pBEaF4NVOViluK83ZbZJ4/uDQy5kxN9ggO9TDjvfL6qlQG3shEtIuMc/L5h7UoPlg7rksXJ9IDy
	EZSCbe02kVWmFN/Hx+UmJMtFq5iMOIFhXTtTFktwCbzom9PbnBvvcBYBQtrKJ1B+f
X-Gm-Gg: AZFdTZeHWbtX3y+FqrooAHagmBq/in2wDreoak+aK7739lag8rpmxxhvDjNBCnMDo/Q
	mGQEo2l9zyZzYHz0PZUU7XzDazciMicfmlxzruG94eaQXVfp8nFBcFluQQ7N6VxuRWPZB6VH+F7
	AM6Biu4SDUOwl8zwhQO0C0syl3EkXugRYChJQX//I5wKEUj42qZWVC7LWMY6rCJuWnkMRjFc6Ix
	tZTTuT4wFzvziQsR3G+kh//gbvUX0VdLJ/ATp3Fa9SQv2VeG23Jajnz1lIAWdxC8vYBgTuS28+E
	4UEGStwjpcpQ7+Ig++NDAgLjTaW2QEXt6Sz4fzZ62Dhjkn+asO6LdhF7Z0SHjV6QD1h/RJYHebI
	ZXUSOPxb0xKrxyXDX5uBjR0shVl8P7q6B7kvMbEn/4K7Vy7aeeUoF9k13ksE4u3WU
X-Received: by 2002:a05:620a:4008:b0:947:832b:5527 with SMTP id af79cd13be357-949ba9a967emr3906147785a.42.1795718297381;
        Thu, 26 Nov 2026 10:38:17 -0800 (PST)
X-Received: by 2002:a05:620a:4008:b0:947:832b:5527 with SMTP id af79cd13be357-949ba9a967emr3906143185a.42.1795718296863;
        Thu, 26 Nov 2026 10:38:16 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:16 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: qcom: enable WCD9378 headset and DisplayPort audio on Glymur boards
Date: Thu, 26 Nov 2026 18:37:59 +0000
Message-ID: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b087c9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H8Vl9kw8bzbrLTmWWJQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IIefPmF3TvEiv7x2HyR077wnc_zCIAu5
X-Proofpoint-GUID: IIefPmF3TvEiv7x2HyR077wnc_zCIAu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX7wEgiEySyL0a
 a6KqOOESOGWnLTEAlbHQFq0lRVqDJhfGdjEV3YLbdRy/GAVQnrzGKQs7eCEw3VOmakWbYPxyZXB
 5TAwTLjffriPULJZOnHO0Dj2NYiQg7H8kK0toPf4zy4KHYtuWGBMN80GtDaPk81EnJhmU3Oe1u2
 UMNPEYFWMMZa+pgjqcvnMNU1D87NonG8QE2KQd6jaPFpiN5yANBw/UJNAMVmahGLGr3ZoqP9Qy2
 wnzVMRejQcwUwH0uINwlI8lcSmvVNaIt7isvv9rnu9jjxzyXcMNXO/nBzZacXuQkjlBjUoyTql9
 o5tYW4+m5Jg0XvJhFVNY0k8D5VoySYohXcepqRt+l83hco0jOBp2fUFZwCmJdAl17pnUzPkHnNP
 /w5MCASZNnCL26ThOaqF0AqOuBkGrL0LKX7nXtTgub/9FgLo1V6CLsQocvmog7x7ar04WkrdJIo
 +rUB/uibpIhmTe1Ez5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXwX24mZO3Fmf8
 OVHYjwuYNWA3gsYW/aCDmNAIVY+Ws6hNWSgrJKxC8/QqP9DXoc+BLdvVXRQ7/rV/wtdVVVx/NJm
 t6ohLhACm35zp5H/rKT5IFj0MIyNkKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Wire up the WCD9378 (Tambora) SDCA headset codec and the DisplayPort
audio DAI links on three Glymur boards: the reference CRD, the
Lenovo ThinkPad T14s Gen 7 (Mahua) and the ASUS Zenbook A16.

On all three boards swr2 is the SDCA primary and swr1 is a DATA-only
multi-master dependent (lanes 2/3); playback and capture run through
the LPASS RX/TX macros.  The WCD9378 SoundWire port-shaping arrays
live on the SoC swr2 node in glymur.dtsi since every Glymur-based
laptop uses the same codec wiring.

Dependencies:
 - SoundWire multi-master support and the Glymur LPASS clock
   controllers are already in linux-next.
 - WCD9378 SDCA codec changes are posted separately and must be
   applied first:
   https://lore.kernel.org/all/20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com/

Layout:
 1/7 adds the Glymur SoC-level LPASS glue (RX/TX macros, LPASS
     AUDIOCC and LPASSCC, swr1/swr2 controllers with the WCD9378
     port-shaping arrays).
 2/7 enables WCD9378 headset on Glymur CRD.
 3/7 enables WCD9378 headset on Mahua T14s.
 4/7 adds DP0/DP1 audio DAI links on Glymur CRD.
 5/7 enables WCD9378 headset on ASUS Zenbook A16.
 6/7 adds DP0/DP1/DP2 audio DAI links on ASUS Zenbook A16.
 7/7 turns on the SDCA class driver and the WCD9378 codec in the
     arm64 defconfig.

Tested on CRD, T14s and A16.

Srinivas Kandagatla (7):
  arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
  arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
  arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
  arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
  arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset
    codec
  arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI
    links
  arm64: defconfig: enable SDCA class driver and WCD9378 codec

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 138 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 115 ++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 100 +++++++++++++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  83 ++++++++++-
 arch/arm64/configs/defconfig                  |   3 +
 5 files changed, 436 insertions(+), 3 deletions(-)

-- 
2.53.0

