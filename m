Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775870;
	b=K7JO+B5LM6I2Y9PKEGEibb2D8MSJiaeg+linxrH4sfjekssuRkl58ZqVrf9ho76T0Hdv
	 xCoSUiaq+tSPm0xV0fppSox2kPxF7b52XUZ+/pCbHf+6E567IGLDQNdUTHKF7zET1VKC/
	 FJ68ZiYH/qy6LzQUoWAj6xH8qqdyG8MyAa9dTpgVBTD4XFtLUcN9OHp6w27JwOLbHbWf8
	 h07Nd2dMCbnHGTI6nahFTFWAXzd1KfgsY3iKJshpnaoR9AL1nL3TghMilOGi8WoVxDaed
	 vX6kTX5eEVs8CypPE/aPT2+8wpuYpID9mtxcAi5N60P9B5f6tEkkoIKov1IFGcM95JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kwbGPSI7Ws=;
	b=PWp+8s4Vrie06D1XI9QooCySMTxrf/w3GRPEgj1pkoubkbkP3pS/NyDvRsUypHxBb7Ct
	 XfnU/7XTWNZ5yHvkcPuvsBjd1EZsUsss8LEI9059SYa43RXf4h3YrwS78lP89A35fNlt6
	 54Jky0guwW5jZ5sv2Mj42Ppd7323jJpeu8kqJ7huPWe0ZE2Uva7X+KgBLzhu0e51BoKNi
	 R+TJ3e9gwBeUw/ND25j4nXADOtH/UbxohkeYNFO8AMNclzkD4t6QrILW4xR7ffjfMqRWa
	 xtNSJSOPty27qryxHrOdX1lY1DY/UWiETW5g9pdO577grwsKsgropz+5jjX0XsnGTqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvJAH84b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLS1F2hF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1BE606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1BE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvJAH84b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLS1F2hF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5sGt4072757
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kw
	bGPSI7Ws=; b=lvJAH84bzvk6TH1WAdoptcY5tPVhNqy6J98PbTXljNp9sURkNYo
	S8dP/m92eY7q7R1+Elldwx08oKA6Ta6CJH+4CQBhm79t22llnVayJnZpAW368tYe
	7bZQsUusNWdKjC7QpwP0K0Idtzs8OsMD6UuFkRJkw4NQJCbC2uDf+SP746NQ/k2J
	op9ulbAASZH+06o8tqNcIap5afQ3ZXvxmn7mwcctx2yO4tbx4y6ICUOfpVb1Nnrw
	zU0QWq6lDctc2fvUyAgSSRqbs3Ap/T/f1nmKS2BWTI1rH71X1fiT8WbepIIKaxlA
	TYYcM8oWlGQ1U+kuKsFrqTx5MFz3TJQWCaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:17:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so178508085a.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775867; x=1793380667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kwbGPSI7Ws=;
        b=eLS1F2hFkCmX95MXvdAuGK/Z3bMeERcDhniWeTtyYk7EBTCsyqwpN7cRe2HzOz6EDm
         RS6gd2qT6DuA12y9C35MZE9SYZCULhrt8WJLSdkEJ8MYM++D6PxGibZMLXWwQTfCmrce
         TenMgTJcZ/yJppoSguRzqTolZ4yEW8PqZZSi6QunYk6f6LHT3fOasLxN5lRJUgsPaZ47
         JyXmAdxCWWjuJiCIq3O9dK6zXtH70y2fgY48+A7ujS1Q0FmU1P3c6qfopCMqlm6JVxqE
         0l8Y/qAO0ox02+9AY4+QckGPDoCphuobv1bURwkKD8fWBNzqefuK2mGA4PHFeAX2unsy
         e0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775867; x=1793380667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bY5AIFa9gIOGPAM6kQqMS0dSkQ+H027w/kwbGPSI7Ws=;
        b=nq3sMqK4/LvEnF2zLyW1CSw++XUnskR3RZpjlWYguJf+HbBS82hzrNLx0LJtzWqUH8
         Agc8h1+qXSIgY+u2aslP6VPXDCHsOvuh+Z9ili1IlMrPwozZZCUw+18GYOeSr9hH/XU/
         UiGrFyYXe2R9dYFB+kUMrxZd++9mKQSqD1PM92Ei7WY6gIbBk9rgzIPd/43eB+UMTRdL
         Fs1E/ixUYyfL8WngHLQDd7+e7JOl2mR75wswe8bPg5Z3qQHINCNsFsD6SvDcwqc0VoZk
         adeB73kIqeEuXcuvCIfe0r+UHbcyENm7gijXNEV8L/zEqGKu3rBTjggcrb90T4Psg7cN
         JcrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5NksKDLnQB2q9wLlag3H/I0ED9B+4G/BiiqbtXbHMLmrFQwTistCGZdd0BPaWaRFMaOOCkyltsgJ9@vger.kernel.org
X-Gm-Message-State: AFq9FYKQhBSQBpL20rIC4B3jPqUJvSnkVnqfViC8TXiZ6H2vrSIyWHlh
	FugvSFJ9gxAEb5v6WUL5JRSgXChrDgLtHudgF5GRX1rgZb9uy93w9nRfmW4IXrhJftjPFN/U0mM
	5mFnqTAaas9TBa5zwu4I/Fswh6qVpu8aXsTvp6Q0maM/wvASSUHUZtm0qG5YEMaZJ
X-Gm-Gg: AYBFou25UhxnRQgoxwpS6XIrIylZZnSB7UG4Q+3JAAzcjFHbuuBn88UxrkGPFz0R1AG
	iQsuDesnikwGNokeDZkEkm6/inq90OelB188K2Qk/UOTYX2aBo6szhveXbY4tSDslo5hZy/kO2E
	xQxe7nEiGN7kesOtCGe9YNuPALOJGIgYI2Y3ZRPHcxG9jBSW1eIJJmtolUeGv6sxGX1cJPHcgn5
	BeKm5Hf6iTmDZQtFdTw0p0erwkj4DAWWSJP3QPtRBvXTjlYVFRvonAltkw5vuyYar8pytVtVSWc
	qjzkjEeQ5DugH8R1YLkWHAZBOL/XNCIef7U5mVORcYDZ8X+robuLTQwADi9j3cssYoOu8uvnvsy
	zVwL5mwzyRRVz
X-Received: by 2002:a05:620a:44c2:b0:93e:618e:a2d0 with SMTP id af79cd13be357-93f6f7e01e2mr537193785a.60.1792775867454;
        Fri, 23 Oct 2026 10:17:47 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:93e:618e:a2d0 with SMTP id af79cd13be357-93f6f7e01e2mr537189485a.60.1792775866871;
        Fri, 23 Oct 2026 10:17:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker protection for WSA884x
Date: Fri, 23 Oct 2026 18:14:10 +0100
Message-ID: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Hp8aKv9Uw3jKI1h19AEW9RzXtP5X1r_z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7xetXVCnX/Ai
 7pdg/3U8CXSFdeO3/EU1jVihqgGjAlLKn5Z7zBn4MZGdZ6awZ4gKRe38VvFc6OsqG3ftziVYipv
 6dYv0diPstBK8sh1mvKhXF2mPYyY8Bs=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=SpZKVrqkZbRJdBaj5PEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Hp8aKv9Uw3jKI1h19AEW9RzXtP5X1r_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXxfVTDK1eQVBc
 INsTFr9Qe/ljmNLhbcBtR8hpZadlkJDSxyAKOektS4cH9j8cDccgBg7sQ8uV3QD0K8udsViVLke
 3QiLvbZCkjbCSElbNsgrl78v5GQXcDePHvXhFcTl0L26oVKsaA9qnoqSWohQjuqAolqLDruZRX+
 +ODq5/CvN2kgkgxX7iU/ci6XaReTXFaFlqHspr2isPv5S3YuLXjXo7eFVsEqjvgWg9A73J9Jvgw
 yHZAutgpe5ZmJKGetB5qL7DXKWT6xFQkuYFVmo/fVgkkFokMITVb7ULhEPvbcaeasDmOgbaXzi3
 4NRgn376nooA49OT8zvOb5LOixwfWIgbtnd19HaGYcMEj0gQ+N1fs4U//bnJLO/NBhDxdCAp10E
 YZJqwHkCbfSAGmlEwVCWy/KReJAPtlVsvpweMxB/1xv1GYWjL+f1TdkvG/crct3QMzdLQe4ePv6
 SithRsQfz3EbqPNvpjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

This series adds DSP Active speaker protection (SP) for WSA884x speakers on
Qualcomm AudioReach platforms. It was tested on the Lenovo ThinkPad T14s
Gen 7 (2x WSA8845) and the Glymur CRD (4x WSA8845).

Speaker protection needs the amplifiers' V/I sense capture running
whenever the speakers play. Rather than a separate capture link that
userspace has to keep open, the VI codec DAIs sit on the WSA Playback BE
link, using a new multi_direction codec-codec link flag that makes the core
run .hw_params/.hw_free and stream events for codec DAIs of the other
direction. This core change is the main reason for sending it as RFC,
and feedback on the approach is very welcome.

 - ASoC core: default ch_maps for links with more than 8 DAIs, and the
   multi_direction_codecs link flag (documented).
 - qcom sdw: per-direction stream runtimes on such links.
 - wsa884x: VI sense capture DAI, die temperature as a thermal zone.
 - AudioReach: control links, VI calibration mode with per-speaker
   events, R0/T0 cache and restore in normal mode, static cfg blobs,
   and mixer controls for mode, R0/T0, live T0 and calibration state.
 - x1e80100: VI feedback on the WSA Playback link, speaker thermal zones.
 - DT: VI feedback for glymur-crd and the T14s Gen 7.

A topology with the SP and SP_VI modules is needed to use it.

How it works:
1. The topology puts the speaker protection (SP) module in the playback
   graph and the SP_VI module in a VI feedback graph fed by the WSA VI
   sense ports, joined by a control link.
2. Starting playback on the WSA Playback link also starts the VI sense
   capture (8 kHz, 32-bit, one V/I pair per speaker), so the DSP always
   gets feedback while the speakers play.
3. Calibration, once per device with the speakers cold: userspace sets
   "Speaker Protection Operation Mode" to Calibration and plays silence;
   the DSP makes its own stimulus. The VI module measures each speaker's
   resistance (R0), the driver records the amplifier die temperature
   (T0) with it, and "Speaker Protection Calibration State" reports the
   result.
4. Userspace reads R0/T0 from "Speaker Protection R0T0", switches back
   to Normal mode and saves them, e.g. with alsactl store.
5. At boot the saved values are written back (alsactl restore). In
   Normal mode the driver sends R0/T0 to the VI module, and the SP
   module uses the live V/I feedback to keep each speaker within its
   temperature and excursion limits.

How to test (card 0, two speakers; for four, use aplay -c 4):
1. Boot with this series and a topology that has the SP and SP_VI
   modules, and select the speakers as the output so the WSA path and
   the "VISENSE Switch" controls are on. Stop all playback.
2. Play one second of silence so the amplifiers have been on once and
   "Speaker Protection T0" reads a valid temperature, then wait for
   DAPM to power them down (about 5 seconds):
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 1 /dev/zero
     amixer -c 0 cget name='Speaker Protection T0'
3. With the speakers cold, in a quiet room, start a calibration and
   keep the graph running with silence; the DSP makes its own stimulus:
     amixer -c 0 cset name='Speaker Protection Operation Mode' Calibration
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 15 /dev/zero &
4. Poll the state until every speaker reports 4 (success); 5 (failed)
   or 7 (timed out waiting for V/I) means retry:
     amixer -c 0 cget name='Speaker Protection Calibration State'
5. Stop playback, go back to Normal mode, then read and save the
   result. R0T0 holds R0 in Q24 ohms and T0 in Q6 degC per speaker:
     amixer -c 0 cset name='Speaker Protection Operation Mode' Normal
     amixer -c 0 cget name='Speaker Protection R0T0'
     alsactl store 0
6. Reboot. alsa-restore writes R0/T0 back and every playback runs with
   protection in Normal mode. The kernel log shows the values, e.g.
     SP ch0: R0 3.102 ohms, T0 45.000 degC
I have script to do these, I can share it if anyone wants to try it.

Tool use: an LLM coding assistant (Claude Code with Claude Opus) was
used for some of the patches in this series, to debug the bring-up and
to draft the code and commit messages.

Why RFC:
- get some consensus on codec-to-codec which are in different directions
- To avoid duplicate efforts.
- Still 1 or 2 patches cooking to force dsp to program default safe value
- test it on X1E platforms.

Based on next-20261022 with the "ASoC: qcom: AudioReach and WSA88xx
fixes" series applied.

here is my wip kernel tree along with tplg and ucm:

https://github.com/Srinivas-Kandagatla/linux/tree/glymur
https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/glymur
https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/glymur

Ravi Hothi (11):
  ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
  ASoC: codecs: wsa884x: add VI sense capture DAI
  ASoC: qcom: audioreach: run VI module in calibration mode with
    per-speaker events
  ASoC: qcom: q6apm-dai: add S32_LE format support
  ASoC: qcom: audioreach: support up to four speakers in VI feedback
  ASoC: qcom: audioreach: cache VI calibration results per speaker
  ASoC: qcom: audioreach: make the speaker protection operation mode
    configurable
  ASoC: qcom: audioreach: send cached R0/T0 to the VI module in normal
    mode
  ASoC: qcom: audioreach: send static cfg blobs to speaker protection
    modules
  ASoC: qcom: audioreach: add speaker protection mixer controls
  arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback

:wSrinivas Kandagatla (12):
  ASoC: soc-core: allow default ch_maps on links with more than 8 DAIs
  ASoC: soc-pcm: add multi_direction_codecs link flag
  ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction
    links
  ASoC: codecs: wsa884x: register the die temperature as a thermal zone
  ASoC: qcom: audioreach: add control link support to graphs
  ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
  ASoC: qcom: audioreach: add live speaker temperature (T0) readback
  ASoC: qcom: audioreach: add speaker protection calibration state
    control
  ASoC: qcom: audioreach: keep the last VI calibration result until the
    DSP reports
  ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE
    link
  ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker
    protection
  arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback

 .../bindings/sound/qcom,wsa8840.yaml          |   5 +-
 Documentation/sound/soc/index.rst             |   1 +
 .../sound/soc/multi-direction-codecs.rst      | 135 +++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      |  29 +-
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  19 +-
 include/sound/soc.h                           |   7 +
 include/uapi/sound/snd_ar_tokens.h            |  13 +
 sound/soc/codecs/wsa884x.c                    | 160 +++-
 sound/soc/qcom/qdsp6/audioreach.c             | 779 +++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h             | 105 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  16 +-
 sound/soc/qcom/qdsp6/q6apm.c                  |  42 +-
 sound/soc/qcom/qdsp6/q6apm.h                  |   1 +
 sound/soc/qcom/qdsp6/topology.c               | 273 ++++++
 sound/soc/qcom/sdw.c                          | 236 ++++--
 sound/soc/qcom/x1e80100.c                     |  81 ++
 sound/soc/soc-core.c                          |  46 +-
 sound/soc/soc-pcm.c                           | 122 ++-
 18 files changed, 1924 insertions(+), 146 deletions(-)
 create mode 100644 Documentation/sound/soc/multi-direction-codecs.rst


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
