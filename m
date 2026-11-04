Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793767909;
	b=efIjybpJKVAZPhTWWOR59HmnEKb4ET7aKKBnz2/8ZijwsNp7OvKP+W/9Oay1Vjp5oXM0
	 scnuTKpAnRZZma3tMwMvFYA3IssmwAYveMJsd8LA0YXAsia6EtPXjRLH1RfIJZoAG2GiE
	 N11TQsvI5TBzxFnW9Apl/Wk1nsSTXQsfuVz4leziDVUx833Noy97c3lLvtNEMh6Fp+dDg
	 GH3xGgIzVhdMvg0ZpYOKNtWZFp5HYaTeH848Lr8LyrcIQIyWLvj7IA5vUF9kZulU7gUO/
	 n+tD5m3AiM4qoJiXidC9E8ZZE//BVOSCg5U5vuDb3R8laF9h/151S/Htq0DLn7ceUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793767909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3RJgO2pJ2GzMSDClBGmlaLUYgL+K5aXBXF8kpIJzyog=;
	b=eDDqiBTmlAbZNsZLcbKiP7pDPhIfFWuBKI45KaeEVmS1yNlRGHw7HrSBp5JJ/+YPH6kq
	 I/vEdLmlVu7KNwhjPHVjdlQybMexT9q39+HMWr/RJmj4I7iLCCI5FhdJ07Wrk3hp/Jody
	 xttqanPbe2A6mTUMD4CMKl9qpLMLLLOjCHEhtp4hUEIpvKOVHgkzUkndgMdjTbahp328r
	 gB82mSJy7MrwenZWbCr5iJ6iLIU9gpSUHJbbGCm1cDJiafT/FB15ejTiOFwbh9hOD/mbN
	 5KcEWW6VxEDwFyzx/+HGoThEQxa9nZXfEUrrdLAjGpMDM0I6GVXHI97SWzg397qa7SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KKGm5o/T";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a5SqVtdR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B00606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 04:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B00606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKGm5o/T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a5SqVtdR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RJ6V1191364
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 04:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3RJgO2pJ2GzMSDClBGmlaL
	UYgL+K5aXBXF8kpIJzyog=; b=KKGm5o/TIUlagb+fI79KuLU/G+AiD3d3ZYQ1tC
	TnIKi4b+Zasq1WxNCGyxSi68sU7AIBPEzINnpEIIT6IBZ1xugmFQ2EkVHuzYA6Vb
	bZAtxhPNINhI2sG0u3qqKMidVwSeqX2x6hO1dlwh5dPE/e0qcOevITV6fglFvWBg
	dVj6+6zOGif+Biw3PoHtrifLghMXybMZNDsNLemvjdQ5OrLQI7PomgQ7duUoUcq3
	3kx4hshBEoSKhMmmUbtBlluBZyudJH6eCdpgQ+44rX7fpg0OLkoenRYpMcD6MlH7
	1YOFW4uWuUTp99xXYDbCbTuYm8zigfRBnpzhggl/bylxM3ng==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pja3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:51:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so579327eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793767907; x=1794372707; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3RJgO2pJ2GzMSDClBGmlaLUYgL+K5aXBXF8kpIJzyog=;
        b=a5SqVtdRX2mRniSwdF8sMF7hgNjV6XFv0bv7IMlNvn+Hb0sJEsFTUedfN6L7q6giHu
         IUcoFle0JLoxhgYqE5ec24ePCc3DTBjaExABq22xE7jNhi0fbRWKKV/uwQPGeAqzrxbH
         x+yhlvV0olv271qseLLtuMbBwejFEAL0JoJdTqhaS93RfuiZI2m7pmQ9JTmW/H/mKcYu
         HNdRK0FncmpvUD2PuYPekMhx7F/FAr84NXJuqYJpOteFtVl04mOqavIeRYZcoX4Cfd/x
         CQEeg2iBVlSgKB4MZStCtkk9oULRy9TJ19OuaNPKc79Sxa3rCxqy2cbcJCUOBisCMY6O
         /b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793767907; x=1794372707;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3RJgO2pJ2GzMSDClBGmlaLUYgL+K5aXBXF8kpIJzyog=;
        b=MDTDJL1pgI4jIljvpM4I3P6vzDsGVTAz0ZNGr+2LJ/1LaKNmy6mfQU4JJReA9yAhf+
         Obww0QXklyDSIlW61iAxYPoMe0byKYI65X53LKW4aJAw2AlGUxzVYsT8kVxedS0NNQKa
         mTmXsJNNrqM+ALDsk28M2ZeJZ+3hapnRFWDJ155unID5BUJFyMbZ2WAcaEpuEMNwuM4X
         TVGdIupGVXrFc6FxT36dX6ZxofG1JCxHOnLhBdaGbu3ZZveez78hDWYYplMGa7S9UjB3
         F2Zz7Y9JKFwJ4y7ku6WT6uiO0usJfepRSbbMn+Cxs3iBW/NEUfYQ9roGReR8HbF2gyT0
         /ulA==
X-Forwarded-Encrypted: i=1; AKwUvBzV9uy3cKYPNH5RH3TxRfM7827XmeWh3/lAzkSbqwxbYOkDNq1mRiSs+zUizF3DXF50igUSOvTgVFy9@vger.kernel.org
X-Gm-Message-State: APuU4Z98bnNsiQ0muLbcFgreptwPcjLJTCeBFnx1qZ6/ExCEQqc+FnGc
	+iOgFpl018xAHFTGkTY0g664SaOwre1DG9OndEI+uFMvbbqIE4S07TIgnD6vZzAAPKAjZmompK0
	OkPSY67IN4/+BEBn5IgNbxVFL5+81Ffd0cM4EN0nhy87eK9ghZwyuwIaLKFbr/gVk
X-Gm-Gg: AYBFou2qp7szEpg3G5exdEybCiVpPq93vU0uYnPlI2fld0f8RSDvaTs3Ytvk1+K79Lx
	EwWPCbC15wS+kz6tNGsSVWSS1dqK4WpZzMYoR9bNXEcYcV4w8EmF/zLT1rSCp3ObbaiKSI8MswW
	2LrimwcwEzKPJCbOfFS5IFBnmTfLyNUq3Rkp5CPJp8iXSRsE5H75OXPrNNeud6Cmz6ot8/2D8LA
	qQqZ6kjbTVaLPRr18UfGkkm4wlaaoOqu3J9lfZJyUSg/qGcSe+WndL11AshRs5Pv/47sb/ZFSdn
	LNEqhS2xftaFkzJxQziU+Hb4kc1PRxWZ7Ar8aGY3ns0vLNgumSkQGHR+VCdYh0IFwmYB/7wbXd1
	/G0zjnSw5Apso5hFZjyzrYikAdzTxSgUjJZ8UYnrq8moXoV5eNAUKH62z8UrOv/SNAnZGweXBJL
	mhqVorUes1NtRHJCtMa52/Efno
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr24894558eec.31.1793767906845;
        Tue, 03 Nov 2026 20:51:46 -0800 (PST)
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr24894510eec.31.1793767906169;
        Tue, 03 Nov 2026 20:51:46 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394c2a3sm3427958eec.20.2026.11.03.20.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:51:45 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH RESEND v7 0/2] input: misc: Add an initial driver for
 haptics inside Qcom PMIH010x PMIC
Date: Tue, 03 Nov 2026 20:51:16 -0800
Message-Id: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
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
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793767905; l=7936;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=5GlVoVF1VkHnE9upYHMiRJV0XPtsefTpbxl0+MIG+qc=;
 b=DofQuZ62EJDQCKzhgQMtHhkY4GbMR/djZiFS8hUMNntp0u95aQV7bGphHY8v5CEHAFFr71TQz
 cysDPB+12iIARmFSpdoXeBlvBNlMnGRa2r7rcXOR4j9P4fl0pLuji3I
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfXwvmExvLsjYUK
 kWKCjmL4Pxb6n0J2rdtlTR+OPV+oDdgTFPRULGXE0RkTzsAqb9ymuEi8X6iW94MwAiXHH2oxFVR
 VVVw5PFB8ZRO4fm6JKRwVa3m1ogWcyab3t6zxNl32n8jJGvlI+jzBcI6AbFMzB29zCNbjkoeyGE
 NeO0D/FMCJXf/bUglohgENqE5IgVaKMyTK58uzQ2aGyYtdmt+zFnEnrJbtJI00hc25TJMzLdU4o
 2TjBpQdub3IRuiiajQmOIhErsCkl/6+6TUCw6bANfuHb3JPTwiULbUZDRAAX6LQpIk/K24yOZ17
 LfK+rHoWe5r7gq/GIv1Dn7xrDWBrtZuzIx41Mwp+JclANo+MiuSMGxsrQBAAl9YV/iCVVJQg01I
 +2QUvtcuS/om8QWVirnHQVgUksSzLKgGyyRxU4EU7f34CQ7jl11nTKXSfG3KP7J16kXNe7fh/Ee
 6qKBl1NyZszkgscTZ1Q==
X-Proofpoint-GUID: H4jRDH9TqdXZ9zKJdjXuFa_oABRfsIZB
X-Proofpoint-ORIG-GUID: H4jRDH9TqdXZ9zKJdjXuFa_oABRfsIZB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX1CF7pRislDWa
 QybKLXxOgtsMIiPklPcrsuqzP0TEEZCbXIA/G52oeKJpa4NGE/RiGFygsxpBuFHWY84tIMpT5J0
 1q5+9ylUUk8JNe0vWDmN6kkxslgbt3I=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeab9e3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wl7bymLZXRVIGl6rzDwA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040019

Qualcomm PMIH0108 PMIC has a haptics module inside and it could drive
a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
PAT_MEM, SWR, etc. Add an initial driver to support two of the play
modes using the input force-feedback framework:

-- FF_CONSTANT effect for DIRECT_PLAY mode which drives sinusoidual
  waveforms with fixed period and amplitude, which would generate
  a constant vibration effect on the LRA actuator.

-- FF_PERIODIC effect with FF_CUSTOM for FIFO streaming mode, which
  can play an arbitrary waveform composed of a sequence of 8-bit
  samples at a configurable play rate.

Also, add the device node in the existing pmih0108 dtsi files, and enble
the haptics device for several boards by updating the vmax and
lra-period sttings according to the LRA components that mounted on each
of them.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v7:
- In the binding change, add specific pmih0108 compatible in the parent node of
  the example for completeness. It doesn't change the schema itself so
  previous Reviewed-by is still retained.
- Remove checking "h->stop_timeline" agaist 0 value in haptics_stop_work()
  to ensure the stop when it's wrapped around to 0.
- Link to v6: https://patch.msgid.link/20260806-qcom-spmi-haptics-v6-0-19fcecd5204f@oss.qualcomm.com

Changes in v6:
 Drop patch [2/3] as it has been applied in
  https://lore.kernel.org/linux-input/178602255123.2917765.7426706813083510078.b4-ty@b4/

 Fixed Sashiko review comments:
 - Add FF_SINE waveform support since FF_RUMBLE would be converted to FF_PERIODIC
   effect with FF_SINE waveform, and it is required to be supported. Also, clamp the
   FIFO play length with replay.length, also document the limitation of supporting
   replay.delay, u.periodic.magnitude and the envelope
 - Add a separate worker to handle timeout stop, which gives a clear
   way to distinguish timeout stop requests from actual play stop requests.
 - Replace disable_delayed_work_sync() in close() to cancel_delayed_work_sync()
   as it caused an issue that the work would be disabled permanently.
 - Move haptics_enable_module(h, false) into the reset action(). Calling it
   in close() would desynchronize the runtime PM state and could cause issues
   if a play is triggered after close() and before the auto suspend timer
   expires.
 - Link to v5: https://patch.msgid.link/20260804-qcom-spmi-haptics-v5-0-77128ebbdd2d@oss.qualcomm.com

Changes in v5:
 Fixed review comments from Dmitry:
 - Change to use "err" for the "ret" which hold error code
 - Remove "haptics_queue_pending(...)" functtion and inline it into the
   caller.
 - In haptics_fifo_empty_irq() when writing FIFO chunk failed, instead of
   stop the plan immediately, just clear the FIFO threshold to mask the
   interrupt.
 - Add "lockdep_assert_held(&h->play_lock)" for the helper functions
   which require to be called when the lock is held.
 - Add "gain_work" to handle set_gain() immediately.
 - Set input device bus_type to "BUS_HOST".
 - Move the remove teardown to input device close()
 - Link to v4: https://patch.msgid.link/20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com

Changes in v4:
 Fixed Sashiko AI review comments in the driver:
 - In haptics_start_fifo(), remove the goto and do the clear in the error
   paths directly, also add a comment to explain that disabling the IRQ
   synchronously won't cause a deadlock.
 - When data refilling failed in IRQ handler, stop the play and disable
   the IRQ to avoid the potential IRQ storming issue
 - in play_work(), check if the effect_id in the request is the one which
   under playing before stopping the play.
 - Link to v3: https://patch.msgid.link/20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com

 Also, add trailers in the binding changes.

Changes in v3:

 In the binding:
 - Removed the ref for qcom,vmax-microvolt as the property with standard
   unit already has a ref in dtschema
 - Added 'qcom,pmih0108-haptics' as a device-specific compatible

 In the driver, fixed Sashiko AI review comments with below changes:
 - Added a list to queue and serialize all of the request, which helps to
   avoid the races between playback(), which is protected by evdev's event_lock,
   and play_work(), which is protected by play_lock.
 - Changed to use guard(mutex) or scoped_guard(mutex, ) for cleaner mutex logic
   usages, and update protection section to prevent race conditions.
 - Added runtime pm control in haptics_stop() function, use it as an unified interface
   under the guard of 'play_lock' in play_work()/erase()/remove()/suspend(),
   to ensure the runtime pm control correctness in race conditions.
 - Removed unnecessary stop play sequence in fifo_empty_irq() as the HW would
   automatically stop after the FIFO samples are played out.
 - Added a common interface haptics_clear_effect() to clear the FIFO data with gaurd
   of 'fifo_lock', and use it before upload() and in erase() to prevent race
   condition.
 - used __free() for safe memory cleanup
 - Checked play_rate against negative value when loading FF_PERIOD effect
 - Limited the custom_data length to 48K prevent potential OOM

 - Link to v2: https://patch.msgid.link/20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com

Changes in v2:

 Dropped dtsi change and I will resend them after the driver and binding changes get accepted.

 Updated haptics binding and addressed review comments from Krzysztof and Konrad:
 - Extended the description to clarify the 'PAT_MEM' mode (not yet supported in the driver)
   by comparing it with the 'FIFO' mode.
 - Updated the compatible string to 'qcom,spmi-haptics' to match the file name and removed
   the PMIC wildcard.
 - Simplified register names to 'cfg' and 'ptn'.
 - Corrected the unit naming for the 'qcom,vmax-microvolt' property.
 - Added an additional clarification for the 'qcom,lra-period-us' property.

 Updated the driver to address review comments from Konrad and Julian:
 - In haptics_write_fifo_chunk(), separated variable declaration and assignment, and added
   comments explaining the 4-byte and 1-byte FIFO writes.
 - Replaced manual 'x * n / d' calculations with mult_frac().
 - Switched to disable_irq() to prevent late IRQs after device removal.
 - Replaced property reads with device_property_read_u32().
 - Remove the 'INPUT' dependency in Kconfig

 Updated the driver to address feedback from Sashiko AI:
 - Guarded pm_runtime_resume()/suspend() with 'pm_ref_held' to prevent runtime PM reference leaks.
 - Replaced spinlock with a mutex to protect FIFO data during playback and avoid calling
   sleepable regmap APIs under spinlock.
 - Adjusted suspend/remove() sequence to stop playback before canceling work, and freed
   FIFO buffers to prevent potential memory leaks.
 - In FF_PERIODIC handling, allocated 'fifo_data' before assigning data to ensure its
   consistency with 'data_len'.
 - Registered the input device after enabling runtime PM.
 - Unify to use 'h->dev' pointer in probe()

 - Link to v1: https://patch.msgid.link/20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: input: Add Qualcomm SPMI PMIC haptics
      input: misc: Add Qualcomm SPMI PMIC haptics driver

 .../bindings/input/qcom,spmi-haptics.yaml          |  139 +++
 drivers/input/misc/Kconfig                         |   11 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/qcom-spmi-haptics.c             | 1251 ++++++++++++++++++++
 4 files changed, 1402 insertions(+)
---
base-commit: 66725039f7090afe14c31bd259e2059a68f04023
change-id: 20260616-qcom-spmi-haptics-3cc97e7b232e

Best regards,
--
Fenglin Wu <fenglin.wu@oss.qualcomm.com>
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

