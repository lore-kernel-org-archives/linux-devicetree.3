Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382300;
	b=cWIWoYKvTAMNG4zWm4Z3hWhB7Df60h/8cb+/7MKs1mG78+J532+m0+jnhishS+t7ie+V
	 OaNqSDSw8p/SNapLiq/jZcU9tLXhYqFiTuvyNkESxT0rCjwzILGdQ6WOo/an0Jdz2PzUC
	 0DoR4tNJeYtRHK4qS8ac+5kCLEWEzEU3p8KAzDHd4mR/Jx/j6g+YTVE/jxKdw25W73wAE
	 Pe8tf3C8b6F+t1BqKpIm3txfibk63oR/MSjYzzQ23nFKlOgNfRrRwZnd9mCwBz1weHsZE
	 RbsCev2IZVKjb1HWfrCifTWf0wW1i+DK8nog7CEKQWnW0i0zxeoFAjTnD5KIP+vCeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
	b=0ZVK4gN4gofmu7+cuOTTGtnNyRu7iCMnv2lQrEY14UCHD6pNzkr14wKIsF19Tdtmm7jF
	 pEvzqTyXrhDD52cjrRo6D/n+uylvA03P1puXm+HvjldLxQXUtlcvaPF72HYkRIxrE22lH
	 +7/twkXAD2CbuBO/8lE335rOjbvQi3z8vTKNsaIS7PhVHoKWMKr9gZxzqAFWt0OWuiZqv
	 xkWBTBxMFgFNtq8ZsUF/9WDbM0qBl+wbovlxCJHcQTnRo5Iv0tbq5UXiLldGnNSWuajKF
	 zOLVXJ9oOIDlmLd3tgtDz0TTRXYs++cFKa6LcyLe9VpD74ftvoASVWOi90pzJMZo3Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYSKvgng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EnU47ikZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEB606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FEB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYSKvgng;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EnU47ikZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KMe82017398
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjx
	fhMEAhr4=; b=EYSKvgngdMKdJd6Ysn7F0avpu8CVtHT7k8KBfQB+Qn+VEass0/9
	Ye/IpFQy4CGxje4LcMDTon+SKVPxI+b0BeD89gPTpHsQWdYN7HKGGD+1AKT5k128
	CwHzxousBsvWwlsZ0yBIDiMJ+hQAumoLD7ZzbpHvMVRWcIiCrxDfhp/+ZJdtlqiP
	ycIg+OwMxAS2o8OUf4TTvnr4kjSMrgDf88SK8gID81k7PvmXpiGDw4jYqqJx0BM5
	eT780Sy7QzJIkVyFJDaJG8WUW5sv+/W3t6+qccnB+Uu0Z/Zq1egv3HtstTGhHUF8
	nJ0AIl2/vdXuZ8wv5wAFUpessgSCvFoJtLA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cagye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so671577c88.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382297; x=1794987097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
        b=EnU47ikZuZuSPfoSehJPxFK0Ur1Z9BU1qi3ff0zotlRBKBJmzVlZAPlqy2EB+rjqjE
         XgHna6n0JkYf4dBCc7SRXACTse1C4fN7zr5pV3libkBc9qAbtGZgRXzKfYvx/D1oxz3z
         K+y+xP7ge1YPXEeeaTG9knK3b0v//arHlMnczBrm5dBbEoQV+wpwcIK/Q7JoXobIMFxC
         6dddiB0LsYQlNMdqDK4oD70Y7sL0w8c7/zsm/5a2ex1ZHRI6yslFogc07js58KIhURIn
         brcmmx7NmyzYkIvpR9qm/OubPK1bn0xhONZsl+lDIk3uaDjNPuetCuB5YQLj3vNrnDNI
         33LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382297; x=1794987097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
        b=cvlsJdIYfA6ZISsijyX5N9o6zc59Zuv3M8KN+xxbpg/P1EYbf5GmcAnMq2JqaDu9y3
         dO71KPLIivPOJMYh2NnL6guJi+v5Q29kKV5PbGLMO9cSiDUYKSONEN1RaJyMzID7FE2I
         q+ljan1XU62wyC/toTIDQVRp86cLH9Y/bbAMuvMtRSoKQOzHcFbbENphUGP4S4tOJpny
         ByEqBng1FoSXlQlhydawDdd9WsxuhOmDWFGmYJV3B+mui7ZA4Fm2RgPEWIWr4jc+P1tD
         jZrnHHbC3WKBbxAe9zAdEwypVpTAAg9DBbNndDo+UT1x1zlPyV4S5+k7puJ0SBph1NMB
         ueiw==
X-Forwarded-Encrypted: i=1; AL+hErEQEYBHcUASa1wDMPQp8ROSJ+IlGhn9VkfDl0R6+EOoWMKCyTmhGZtUCV07MSmoGdy/BT62h8EM3/kh@vger.kernel.org
X-Gm-Message-State: APuU4Z/xrLgse/DGAE10NLDuYjApx6SJihvhW5ju1x43Le6IyBRecCjM
	YDgMmlMts5hOxP04TxF65wOsauPe+gSoMzLJ32t5gK2f7mR79IuX8CAev/1UpI66wWhqFx2hC78
	9jKZTusoEoeRgDhDn2NS8Qr+eC2dDeigH8KaxDtSxKr3110aCpQZ2CQj77FlVqSk7
X-Gm-Gg: AYBFou2dQEUH9+eTpLVpeXT3+GAP9TtBqEpeZqoOAybNBz9NlLLb1bPeVruvXNKgjKC
	dcmd7NN2A3dF+rv4fvWrXL46gSKTlI9EvH4jd6xjVPpkl19+ji4DT/k2a5Rt/cuABslORyPL6Ls
	rb0p7u6DHA1LtzbI/BMClNRwBp9ZR4Vzkv7sMwV/5qkRndH0NZ5J9osLk7aAt/zr7Ot2+Blz02h
	CDtZOvfTbHhqRPlhOHQDsjBQbTWu3ZSN483AbqHOV8XNkoqZYJMMN7KlHSsHBSPdhGMmrP1X728
	DzCxG21UduA82YysSdK5/nHpcmWGoXSfo/kroxiHZU4DCJ+j/L9BHjGBYcFRX6sPFe5qzWTstCe
	75jSeG7FLH1TU5S0qfoVITkRxq0BkhvRftwjWLIwNC5UVrV23sHJZIMwwR8BBmM7dFIGQ4jvD2l
	3sw20qiuw+0xiDBpZ6RB00186uvovaAI/L
X-Received: by 2002:a05:7022:1507:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b3bef0d528mr2888473c88.4.1794382297292;
        Tue, 10 Nov 2026 23:31:37 -0800 (PST)
X-Received: by 2002:a05:7022:1507:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b3bef0d528mr2888436c88.4.1794382296484;
        Tue, 10 Nov 2026 23:31:36 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:36 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Add audio support for Nord platform
Date: Wed, 11 Nov 2026 15:31:16 +0800
Message-ID: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX9b21kE83HNXA
 HueLlKNDnp1tlrsfZZQW4nZgTI0DkBndcXEPDyjEjRmcg8/PpTVZZSOXQLjTqeVyBBlFiBYOQli
 SionaBERIx+XcYIVZEmkuG5CyeDZBdqQnLogY5D1jhLlI6oMLHV8EXDUQy4eH1O54cVQKtiIwrZ
 YHm/OQpeJ/HL0m63lKj8R0cbF8CBNx6BC5+X/9fQiqB+gKR7aHYm15yft0ncO4ucRw4HEczAPPM
 wIfwq1ay2F6G5WrLwZb7L4OgRHKA5JG+BTFiThl54rWaPg1HZG63i0zWFmOZpYxMNUF4kN6yWC2
 0Uwuu0tMKGWUiH2KQbsIU5ZRviidFoPG+MDkl/rBeEjyI35Xg+9Ek80InRwxykKSiS5dYeviIMh
 //UK9j4jqrRznZV8Kv1VqC87Xjm0eyv8P8wu0A/9sjo9nPJ5wa6V1zkPUvmk76sEdpkwTcu7zEf
 wVe0ispkRo1/+8HdZWg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af419da cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zx-u8faYscwgyrAVXPQA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Rye3b0FIv57MPWziCaqpwLGbvaHUP_Xp
X-Proofpoint-ORIG-GUID: Rye3b0FIv57MPWziCaqpwLGbvaHUP_Xp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX/fx3FFSQTUUa
 UYpRA4g0cDQriFj5rEDw0kIxU7IdJ++suJMVsCEnpKvtcIRPMUvKB/Wm/zBWnmdWGXwRvCQCV8k
 U61NSgHHtvpxrjMqSPtIH5kdzw6y6DM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

This series enables audio playback and capture on the Nord RRD and
Nord Ride (nord-ride-embedded) boards.

Changes in v3:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- pd-mapper: Add adsp2 root PD (instance 124)
- pd-mapper: Add missing NULL terminator to nord_domains[]
- pd-mapper: Explain ADSP root PD and shared CDSP root PD in commit
  message (Konrad, Bjorn)
- gpr: s/nord/Nord/ in commit message (Abel)
- ride-embedded: Add missing space in vcc-supply (Konrad)
- Link to v2: https://lore.kernel.org/all/20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Tag the series with RFC due to dependencies
- New patch for pd-mapper change (not a DTS one but targeting Bjorn
  as well)
- New patch for i2c18 pad drive strength change
- Support both playback and capture in TDM mode, 4/4 channels for
  playback/capture on RRD, 6/4 channels on Ride
- Use lowercase hex for iommus property in q6apmdai
- Control DAC_ENABLE and CLICK_POP_MUTE_N via regulator-fixed
  and simple-audio-amplifier
- Recreate RRD patch from scratch (mimic the new nord-ride-embedded)
- Link to v1: https://lore.kernel.org/all/20260914024003.120931-1-shengchao.guo@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  soc: qcom: pd-mapper: Add support for Nord
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-ride-embedded: Add sound support

Shawn Guo (2):
  arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
  arm64: dts: qcom: nord-rrd: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  32 +++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 153 ++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  40 +++++
 drivers/soc/qcom/qcom_pd_mapper.c             |  22 +++
 5 files changed, 412 insertions(+), 1 deletion(-)

-- 
2.43.0

