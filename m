Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627127;
	b=z6CBQfoBMSpVUb81n1+c+h5dA7maH4/JFjRZSTTdMisp7th4tk1lEk+fWH5WzW4vaOv/
	 BeGWhHDjRgmGpUXNZw//pYlyxr+0Uq42C86BWm+r7NlhhlIJEkjlSBcGr/pKTjJKEr3+a
	 lnFIkastJ88U9mlHyhrLbezQs/1JrfNMXS2UyR1oSMxIRV2cVBvWrkWbNt1qbjJgbFpfP
	 FfF2CVGT29eBMaer/E6hH4VrL8G6cCjk2Dq6cGCrtoghs8xohcRYWWYjeqBdOMshRChCl
	 xywWvQV1IcvOtapKKDaLHtKMFV/Ju2XFhppb156wsBzhkV1jj7u5j3nKlbnd4S/p59A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
	b=4sZ/Rj/CjS4yPlhfoRMffoCgOnUpcvl9XmcPGt+WV9+QZcCr+bKdL7FmPAA9VT6Rt6iS
	 wUaR14bhM2PeuPgBx3ZqgsWKP3W5JT16/G/M5Knuk05awjaFVCBGEJ0JAHIzyKREF4J4O
	 geDPiD9ezLgryQp5jzqGe2aG8csnhugIV72JgyUQEgDOhw0ahNM3WdKbZCvl7Yu+TaDhw
	 iQwOiVU0g9PREY4KHgb92P2+nJuURMPKQfnpo739ax5c7zu7km/SNMs2GOvD5fMzxrZpZ
	 a4eK1chyrFp5tPP8rGlec/35WavaOQIEs6tv2JbC8FpXtCwWws2+oMA1hULg7eN+F6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CC606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQH0l3007927
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBY
	z5UHPL5U=; b=hV1dUmhFcGwxiMvJ/HgN1LQ5D4biRwZWojEGn6SFkVkV9B9HpUU
	xPYZ8SBB7tyLjo5cTu0ivsCYXVZMaCahWfiaNP7E/LPo+YZhBNYvcF4roaJGjpjd
	p+uXejDi66RNtKF5XcvJYI+HhTe/+oJ1fhXiEL7cist8FU90ZxNSt7KvGzaSAQxl
	KnLlw2L/JLY8isXn/0fjX4CEUDEANYsVXM+v3RzEuv1r23xXmeS6OvEMM4pz2e3u
	dZ5usAb682x49tOVqi5vmP6LiugzZxGRbl4xR++KOevDQvNC9gerSnqLEFHIKHKc
	p0e9cVrTs416wPBv6svPixgUYQFz+cj2FhA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukt0ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67c1c64551bso8993473d50.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627126; x=1796231926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=IIMibaY4iOXLrIukeWV8zFLzDlVnf0cEoXhVEErs7p11D8u4ypPfwTcyjc1pNzgO+Z
         1ZaozxIsonPmCMweLeppYWEnvCjDNvWEavT43cVlfha9cMcgj5YHc1LCKwq7rvoz6g2a
         YZBdR4PX5agEU05n4yleZUWqMfL486yPSPHksJO4F33RSiGWiq0RKRayTQSlDrfrdEo3
         edfm8HYUnDCwnff+NEq1pjjbSASY+opQFkGE3jCJGSHv2pmt6gbN6dFUjA3XQgmpNdCO
         mSSfVTKp9xPIHqbtN6tjE8S5kXoKVI8sI2xnvNCBtXGCEldPFg39WPHorFYfC3coSYqj
         cjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627126; x=1796231926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=G5Bnc0nHtmdus4etsrDGm8P7JGjmt1VV9ScLip9pue9jV13Vnfb+kELsKiIM3xw7tw
         Z2SU2fWefTNW92bWg7RFpJduetUp1uAnGN9Cmusb6LVLVJaneXoOy3BzwriDpUC8Im9e
         WQpUJAx+uo59Hny/vkNE3crOJvCXpY3G8YHyoPlbiKCzhco5XN2E59GIYq/88UHeGsqE
         VKlUQG5xJuwZzi32eo/GmuDozbEVBZ7S7Hyx1yWuVsE+wypbmSoHxZKU19WSRUlCM6Im
         +b5YlalntVGtCT8beNluvFghefGbWdy0kBrCGo8xJ6uujNo+UYYeh6z9IelTr2zvFPq7
         Utjw==
X-Forwarded-Encrypted: i=1; AL+hErGzYePytn/HOcJad/BPLX7OIriejhbWUpvHV/qeIQWmM3sP8T9Orjkq4DQAMzc9BBFV4AS7xWjVgJ3g@vger.kernel.org
X-Gm-Message-State: APuU4Z//i0mTGSfbRaIXj5Mp9PL2RshXtdVQE886FPuvsO4hBa3gIT7k
	2WLZkWsRgLJmWlYGm6UVH+yQTYVZrEIiZMC5+3CkZp/V4cHx1Xhb/+Fp7UUWxZhKWyDYKsQ5Jvm
	E4Lv+Y9kRZb2BewjHvYjo42oHGbg7KEt2CIFdJ5INotgWAEPQRurlMks3DXk7E2kY
X-Gm-Gg: AZFdTZfzHdD8xjMpI1tboHBh7hYSIBoWR2P17+Ys+Ppx7qHDVGyoE6YB6YkoxfA/Ci6
	8Ae3tsBCb8j4qo7zPpX7ukx6Edl+bbMysbOKzIAJBTzbps0d9lQLyRLTKaSE6IVVwVtbfpPuOJR
	rcIGHjrQCmQ7Bnf9gRph8NEwygX4ph1O3tjyRHPhBeygw7l+FMq7xuMrOM3bieMZ90Zzshnb07s
	+Od6cErfFclC/UxkFw1LCbE9DaVMV2mXUNVK+STNPyCJqduSBW+XP/ClgCfLkXD/MLZBmt4vFwG
	OLH1xg3tfACsfuSEj7DR0WKFr0HHNtjVLia0Vsc8GXiNueyRfKhOUvpx13Q6296gY0CmFcj+NXe
	tWVOb4gLEPNINAdfYivno58RW1c0JPU/GQ7anEagX+dOOfaMrJSQI2jGuDok0nO5i
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127727d50.14.1795627125839;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127699d50.14.1795627125392;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: Glymur LPASS macro codec support
Date: Wed, 25 Nov 2026 17:18:29 +0000
Message-ID: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b071876 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=OBTfIaPFV1-Q2Zl7jqIA:9
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: sJjozC2WMMhace2JZ6XqWSInNl3TCQb7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX05W6f8p9Wug3
 xxXOS1C+KG7kbRJfapTdY2kyeKhUOs3s1l1nsPG8UMg/uJVtB4GXcYxc9j7CJhiuQPOH555BZjx
 gvHW5QN4TbB7Hpha2379KbJcPUHicng=
X-Proofpoint-GUID: sJjozC2WMMhace2JZ6XqWSInNl3TCQb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX1ZHTG0qvZL6W
 sPOFXhKdoPUQX4pqjEuHWwGXNtSR7m59CXY+phY0dg5Vl+8dkiPEwx7+Bp8OvJV3Y9ilPbWgUot
 nXu9ozZxXuiNdP6Qx2kLP5a+a7R0NaF2MCk3bgOltdiWRrTjeXtXz75v3G4ji8kZCeMZPAf1yQT
 kQ6EsAGnlfAtMvuX11C+5dmqcoPmCzMk/CtpstM2UwGivg3fDrnMXpGeZX0G23SV6LLbec0BdIy
 SsYlEAs5jud/4lvRX5yuPXx1wMPvZWqCaZkkyDz/baaYuRX8oOOSpyzJ+v7vMP2Von+JqHVQgzx
 QT38aaZSyp4oNm2Ylgri4TBZy20ZtozXRebWC+jCnhTgHYKjQiIX66fVAPLRQM4DdwnGebztOqe
 pEefupzluFAHi6L+QNlmm+RwTRf3vu7UjFY2FBj8YltWu6/KWWe0/KKFrulkpITaSfxz/2QOdeX
 fZHd2zH5WpA5vmGNSCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

Teach the LPASS RX macro driver about LPASS_CODEC_VERSION_2_9 (the
version reported by Glymur's RX macro) and add the matching
qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro
compatibles to the existing rx-macro / tx-macro bindings.

Based on linux-next (next-20261125). Tested on Glymur-CRD and
mahua-t14s.

Srinivas Kandagatla (2):
  ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
  ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs

 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml         | 1 +
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml         | 1 +
 sound/soc/codecs/lpass-rx-macro.c                              | 3 +++
 3 files changed, 5 insertions(+)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

