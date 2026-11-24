Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502653;
	b=PYksx6ZeWeDZBW0Sku3PgXHtXr1eYUqAIWvoVLqQYm7AzlYVsHHjygQ/rA6/IrNgRNPv
	 isgDjJ1dOPD/mXoBEeK2A1bEWFiXj3JwajWXZaT1qLqDhsZTSZWRvinyn0OHZX8L+Cpen
	 neP/qg33vX00YPgpkqia7vdUatTd8D8HMzt7mM/7LBVT/IuYAHRoDDQeO+DTwFWhTeWcg
	 mJO5fOh4+QLp7oXcIiM/0aCf+ewyz8zEB/GLVeO65GG5W5e//E7X2lPh171RD740+xQKW
	 un8rEWVpuwN2Ytx3bH5x0VhaMW0Pkxnj46lfI5jtbgSRmvdcGwDaIDneFNPjjSbYxQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
	b=Pd2VCtN/OeDYcusUge1CeHtYcfJ8dLCvBk/zj6BPCTWYPSrWs0K9h8dhZz7w/TbsGWvh
	 CHnVkKO6VEDbKGV5WrVA/VAmu6dsuMvtes6hkSfkIsrpOZfwPktUAh+krzTSHNNkROUv4
	 6xZ8UhMaP/RXK+A1CKBgtGK97Vmhr7C4W5/vgX97cKDzBwiujfG27VaOW6/e+I5cPJwc8
	 xF/FHBkkz8gRf8eGFP5ZRrLZHmgASl/URRy1xcv5PdEoTLVR9Asyfsvcafi517gqeX8L3
	 xvQOYS13g0//K3aSsyaT4UBAgvtIfwJEPn8BZ7VZo2tBkfaleuFaenpmZbteRx5krKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBjw1Te+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE08606A332
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE08606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBjw1Te+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lhup1598316
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r0ByY2X0iY4Mpi/euGIX6Z
	+pt0UGNEDDDpkbV82aFgU=; b=KeUZzUi8LBi2ZjoH5n+PnElc2J7ns4yoGnGUXk
	30iU0Cw+cM0uidj1aWkDFexzRMktgs9pzNaYxLOj+MOzZCnNBVK8lZ1x/Sf+2Cog
	PbdzJm+t/SjepQ/OKITnPy9QoKyu/OAdRvUY29Ko6IeL2NpvrhhlYrlh84i523fu
	s19Kxt+KyE9OVc/6GTZpE5gx5hr9NVjcGO8YTdx+py7/tFSTEJTkBwVQS9ZXfKlU
	StLFVUFhsPUwkv3l/X5qV565+Ce4nqzOmAlRU8XNqH2SYWDv14L8IphNGfeHp6q7
	c591O6AqiVWDwbLjfwBmY7Y9sE1nR2wODJlhmQuLUgm/rr7Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqj6f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:44:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869db50548so254676eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502651; x=1796107451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=RBjw1Te+CwTRvukx2eVWfNN92QF555cuqr9kuP+GPzCFMaGSaqgZ5Fz9rV39VwfY8x
         rTbtGU3FfHOyz1qRDMcn+NPdyhCZj42djegYLj7SX6RAJz5MgdJdmlFDn087RqZ/6XKi
         FEMIl3E1qsaEpEaGboFUmRr0naI4uVAVnfVDvpCtqNQBzzYOAhYrVU9yoaCARFlnFqP2
         BIjlE04BRIBRJ4AFnaCAlL4vwJGP4AjjvG41TX/IYDJHsQDdF4/VBPx7ib0yi466PwVC
         9psBcRhuhESiFh9vAZRTDVcPyut+Gm/xMpXHUUi7dP8dXXzZUu60LhBDWhvSPA+myTEl
         pOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502651; x=1796107451;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=JRlanPSKe2IbmgJvC9EyPzrs4sRxgykzWHpFTN/0vQUhaqSFteqagKS1X88nbWeD2C
         3wTSwfWBu9aN20cIhWHG0i3fU3w6updsW/odovRoFY3sM/pvMHrH0YChN2ZWQpH3pM1V
         +5n0DPt2PcSBkQ6RvwzvY2TdLxfleeSYjX1LJ72QhfyFnCHATEIDYJqVv4lTUswVU2UJ
         MMjL/UXN4ThsDZ7cJQeoA5FNOVbUUDSdzk8S2zHpKRjf/9q/dcIfegbuECB2ZY9IzM1u
         pvGfcR0uUrDhXsVPRuuDkhPRsmhNH2T44qvxuamUfqMf+aX0HXq/4cUjJjxV0cni02Ec
         meTA==
X-Forwarded-Encrypted: i=1; AL+hErENR+ut8FsQ/wLH21w0Z0dfip4sh2cBEnSdCjyjaZs60+HSVxykLgXgbeICXsgZS4SlhWEDzgt5JOjq@vger.kernel.org
X-Gm-Message-State: APuU4Z/OqJCc5O/XrUhGv7QWMTJ+sUP8R57PrueFIT7nkB4Bn7ZP2gZH
	ejmN/s0LSCtUad4wgzmtz0CeBcAcpD1vkGVsR/JLwziot9cjtnDLQLlxFUIBV3ryax7a9jNYwDy
	u9BBpxaG5qYfGO9gzZ5KOHnTje8vGFz+nBoaADZjA+A5FkRxi7A7Am2avQXeSo6A/
X-Gm-Gg: AZFdTZcNbz4LHol8Xg6rnbNOBICQjedWeAOjQxCMK7OnASKHejKApnJZMX8DG2pCUOx
	h15O/PlZ8faSTqPPX7/NGXmksJbF597jb2WZuYGnxwyPZTX5j0YfPaFfGPZKygd0HEcn9d6sYTI
	VDcvN+hQ+vTsTawb5JijNFWE6QE2OSGyZBdfmsnISoAw4cLcpXU9cRn+lxa6tDTV8a4mHfSpvCV
	pxw9CBDkP1PJuAnVvzO1RvePzPbBLm+/OCVv7HuLl9iFbuoIqDeqXeEeuXtWV/f5MyvuBzgtGvY
	drkQsIhzPar/1H/oJIHkaq2e0+Nt0P+zsDYsBYmsOaqCswycGPNyczI2qisxqyIsyyTTU9lLavd
	anXIquzGRAj7VC8Z/mS36wl6vwrcQVOECs9guuHcXl6m86GymncAe50Jr7aDdmTUTxmcmTxuvfp
	JGBDXb9IoioD3NYN/vncHLaWsfbn1PbLBVjw==
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860131eec.2.1795502650363;
        Mon, 23 Nov 2026 22:44:10 -0800 (PST)
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860096eec.2.1795502649741;
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: Add support for mahua platform
Date: Mon, 23 Nov 2026 22:44:02 -0800
Message-Id: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADIyBWsC/32P3YqDMBCFX0VyvSmZGI3Ksux7lFImyVgD/mwTl
 Zbiu2+0lwt7M3DOMGe+82KRgqfImuzFAq0++mlMQn5kzHY43oh7lzSTQpYAkPMBuwWvPvh4pRF
 NT7yiPC1RoVCKpbufQK1/HJnny1sHui8pen6bbKAY8Yhuss89WdSg+a1/DkvgKwAXnIStjK1Ba
 SW/pxhP9wV7Ow3DKY2v/Y3BSHx3/NxkwtVOONPK1jnbtkVV1K6UOdXCos6tEoWSuiRgO1Dn4zy
 F59F5hYPon3rrjmM0CE1gjUX8g8Mu27b9Atvn5X5KAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=7521;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=gUE63zVZIVeUvmErUr/TrSMTqv6lxRJ/fp5Y8KWuPVk=;
 b=Y1VZuEAlW8OxZVs/P5hijwld5rvuRABQSv4jF35P3GPgC1wI0Liyvj8dL6a7vzpi+OfR+zpU2
 uUCeSoFky6SDjvqu3IcD7+jiVH53dEAGSc6UTU98lk4nfCTFoXJT5nz
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b05323b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NlngLaH3A2d4KlUMbl8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX9O35tA5ku9un
 uD9SVmEC0Bim1JnyDwb/e8NPQ+dXa4+Ff8A8rJEo7SvAob9rnKuXIw2dHBkPKqaZKrSvrMagico
 TzTbl1uExnNlGHMaDdjCR2KricYWqJMqO+vhZll7Aqsv3kcEfGLmORBby7sKpTNOwpVvFRlAZvg
 sgMWIS7Lj9lJy+hGa9fPLanpPvg6jSmrkJu2x5lEXOXUfxby/UG7xKlVXUNFh9O1AYENKdWJH75
 qzyplRwL9kKtrei/hXpwhgJOm4IGled/PoLHf9PQoX1RJBrBhg1UX2Cl9we7mTdO7E2DM4pqzja
 vAs23jFxt0U7JIVZjo79El2QY/rVV+SATSkbYKdgY8UJo8TBpY1FDcE8xA+59NwSL/gogXSPUTs
 0AaYAv4VoStT5Drm8ad41Q0LSYPZ/7ESpPPpk5AqjvLYnSHcOGn5Pdbe9f3PvBdcpi6ap5yEQR5
 Lfw+dULTz3vcnQWl+Rg==
X-Proofpoint-GUID: 7l6gqgZSxJNvGGKeuxjiZuqW-aOMleN3
X-Proofpoint-ORIG-GUID: 7l6gqgZSxJNvGGKeuxjiZuqW-aOMleN3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX6rnH8LXog+0s
 oTNuriMnQ3swpHm1N2011TJq4QxcQPUopGecp1YG7LD8mUMbOjFaa7OnzbhU4GdYBDhYv/fGMue
 4nuhVZEvzGL31fWJK4C4BaT98EkWcUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Mahua is a derivative of glymur video accelerator with single core.
This series introduces qcom,mahua-iris video driver support.

This series depends on the Glymur Iris enablement series:
https://lore.kernel.org/linux-media/20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com/

In particular, the qcom,glymur-iris compatible and the corresponding
Iris driver is introduced by the prerequisite Glymur series. Therefore,
this Mahua series must be applied on top of the Glymur series.

This series adds support for Mahua by:
 - adding the qcom,mahua-iris devicetree binding
 - adding Mahua Iris platform data for the single-core configuration
 - adding the Mahua devicetree changes required for vcodec0
   clocks, resets, power domains and operating points

The series was tested with the prerequisite Glymur series
(and all glymur series' dependencies rebased) applied locally.

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

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v2:
- Use iommu-ranges instead of memory-region (Vishnu)
- Fix dt-bindings (Krzysztof)
- Fix order of patches and iris entry order in mahua.dtsi (Krzysztof)
- Update to maintain alphabetical order (Vishnu & Krzysztof)
- Update cover letter (Krzysztof)
- Rebase onto latest linux-next
- Link to v1: https://lore.kernel.org/r/20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (3):
      dt-bindings: media: qcom,mahua-iris: Add Mahua video codec
      media: iris: add mahua platform data and enable qcom,mahua-iris
      arm64: dts: qcom: mahua: add iris video codec node

 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  67 +++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_mahua.c |  44 +++++
 .../media/platform/qcom/iris/iris_platform_mahua.h |  14 ++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  33 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  10 ++
 9 files changed, 374 insertions(+)
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

