Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D763909AE
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753396; cv=none; b=sEnbjIswOs4zRnPekzjJKSBv7zFC8ANahGSfzMrKVEYQ0Uf02v6766gKKlAi4dBpXgSSx0lv0DF6/LBbZlat218ZF/Fg+lP7veqd92YRvZevCAyPeAggOdK0P9HHVd3D8NISJALDxM2Dysbn7LeP80yV62Et0wZl1S+cWNey5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753396; c=relaxed/simple;
	bh=gq8aOZkBsiDMRGuZvW0oMU+XJc6ElAnhG4Gvvrsxc/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N74hw5tBZ62zyWDDmM2i2cts1K3zZh/1HwtkIE1wmX92b6dhHY9la5/5nRREn8jDRHdNRKC9yu2Lc70y2g32ABAZ1Ge5ShlmBqUTH2rOn0JftohiumI7tzTusWnL1vki5YjgaDpu7SlMJWPKAiMbPzMkFlOUTxCjNGvA9ps2ZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS4ZwiSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c34tJZG7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS4ZwiSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c34tJZG7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kFjn2811932
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=; b=CS4ZwiSw1zMaWqIm
	7In14uybYiHzrwtZTcivLMmHYFSnz3moN7VoAusQ3YE/2ktdl9Rw+yb2RPIpCH8q
	lfWT7i+1hWEjX7uz6IJ9F40apVvCFdJGEW+RPFjShKRvIOALHpCZK3AHl0cT1QQh
	ki1xDb4i6p/xhWXfdhbmq9zW33h/M8o5seY9/55O3T2a9GzyUk0XjOOJ0AKqRbUO
	UJb0O5ZoX/TozbKiXu7VaDBnpsBeI1sVaSFKYcQvuxaYg76W8d3HRHmwwJQhH0Bc
	njSLvlLzLZDoXo7QeFiuaqS4ZH1PsONXWcZlwWBeWFTap6zVEq6bE+mE4dzznHUH
	GIqVEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554a9hb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828ab3b033so5381352a12.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753394; x=1779358194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=;
        b=c34tJZG751WwGWVMdwR+aKJOtNzoZ8/lRJLUyxMFkYZ/YS7sCMMXPhnd0LNtyMJq8z
         zBB/WlxjyioKp7gVdONxfDTIKqgyuSvvJF0TB+sf1r3SxCq4WBMhmcjIQBfV+2W9Ewz1
         ttY39tI6KKKm0gU0+7y+qOtsvu26Zm+xMR/vf+/cpFw/T8QDaP0BHLatjE8ruVm3ywxx
         H9BevbbRM1ipizLX3OjWWXCBXCdzHkera9eZ/oZlGcP8866oaIHMp3svHXSyOf4J8Gfi
         2M/U3EyCR5ktAmnk81gJuTCWT3qiq0M0FkhQqoBHz7a2LxkFYoIgctIG10z6VrFjBcIw
         wv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753394; x=1779358194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=;
        b=BpnkYzpHV1Le96iZ/2F8NjJwWo2PU1XtI1OkGQGrRpR3zM9vtFo1vBMyCmYjtG6inl
         9Ho6Z9BnnJDZTF1A82hsW3mpjlKzL2MiQOY60KONz9FxkkO86bS4aPp/szlp7Vq0VFJ7
         qlqONnJSG/GAhn20sZtdR+m1H7gYuonOHqYKtEqzHfN5c4HcZ4xpspucbJOJhBOJPWmy
         H9G9gNjayEeQsoL1XaYMdHZRRkusr1d95mNJtiwCyOlHVL0Qv2zH1Z8WFqwWZkFu9kox
         feIO8qE0rpHkA8MB5qeS+mSNiOO9hRKi5do78BUOD9FoQ9N4LAd1mUPm0sESCpMx6RGe
         6nDA==
X-Forwarded-Encrypted: i=1; AFNElJ82CXA1hXRa9ki4PfjrLBVr7R0gI7s56HVMN22rqxLqNpeDQC9Qi68mQk8L8exj1kBUo7mOwfYlzA6A@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKTcdNAHbTOqNJ1mh1v+3VBAQHVUgEO3PaMbnT+yMunpHNNlG
	QgOc/b3s8qbd9wVObNYHO4NKzEvhiJkMsLgvwYyLcAaiwbCnzBb/MyuSq4m6Gy+lXIUysaW7WsC
	nNWb8NdbFjiSSeLdwBPrm0o5g0j1T+7O6YSk9HiXk1PoML4nhfSvHmLWG6MqfoqH9
X-Gm-Gg: Acq92OEieeRouHrFz5wterzZSvqNColdbM7ZEhm1Yfl/Ih8QQUTKuO4KICjICQNSWzv
	lyePmwBYv/9L9e+/7BFgLspnshH/bnAcKSZExXUC8Svkh6KUDD1vMynO+qAkbpM1vyOuenw3Mlt
	fLZUW5C+mQoSgsbtQxItq5MLZyfIN+56/LfVa6m6Rh00+Jatfll+TWzGa3NLaRMDCWbs3fiJWTK
	cF7wEwtjySjR057TkuBdTCMnrH5x1kvDXWmAqfBv+sf+yUdC4JguIjekKCkRtgw+37r0d0b5wbz
	Wvs6KAEdAt/3EeV/rZxt0uvJjPkr/c7jhP6JOGom1ZERowa2LTAbL6UJRqZrZ6GjeuGL+nvmYa0
	sRhBkOBRJOIYy/LVh0LFuO8URPZtWn7ELcFyzEKFfwKAQeBpdXtR/Rj1pdWUfHDuDj5WF2Ancv0
	JmX/tKTT+zLVm+Q16k6fgc
X-Received: by 2002:a05:6a20:9155:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3af80c7c317mr8223419637.18.1778753393355;
        Thu, 14 May 2026 03:09:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9155:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3af80c7c317mr8223387637.18.1778753392871;
        Thu, 14 May 2026 03:09:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:52 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:34 +0800
Subject: [PATCH v7 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-2-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=1865;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=gq8aOZkBsiDMRGuZvW0oMU+XJc6ElAnhG4Gvvrsxc/Y=;
 b=4aNTlavU+CQmFQ6AP59YVXJRskb91Vz5ZbBGb6tUVJLE0yySTBb+IWmNBj6z8z1LirkZ9aJxj
 CQ45om64z1PBOL73Evs79UWz9q9Px/bqv+7ftolhMCfNaYRPt3S397B
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: Xce6kKDY6C0Owv2odV-F_qmAHI7M5LDJ
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a059f72 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KtZWPW8jcQ_ObEEXPWgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Xce6kKDY6C0Owv2odV-F_qmAHI7M5LDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfX37HmokeX7TKv
 fH0guS3A4RRboQmayvLx30BHhW+6AuvIQOFrP5EfSORTTbYBDsdcsxZBNIer0ygZnGZDiCMPJL/
 9U4eWqzAKKWprVGzhDRUosBIeSsGzv3h7ntKbBXcFGpnuEMiICTScDe/HN9G4NsJrXU1abH6xhU
 T/j96bCI9pHvIga34VJ0m2eFxi0Ux/gJDxlKUWgvmsohpEb28kKQfh3EBEuV+O3dxlUmxdrrDzp
 Tw+i+hCx3Lf7i3SB3kMS8n9BXInXGoHtCKFyCmsL1hBUZmByt7rnaCknmEg08CCegjFZRCDJE/E
 v8Y77nAvJXSqFxvnDw5VbL7nSEs5MBIc9A+R5oT5HVnWD1bLH8JDHn4RQOOsoveuW/AvAiDY8C5
 Kss/SfvkXWiyzERbY93j6Jy2/YNIz19Gg2H9EFzNckvPQtcXtF0mktkspa0hPFXc+sMWNLgQ/Qy
 q+2O8x6oFT9BoX0Zjwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140100

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2061dce72facab7c2b58d6b3bb9b9..7d322306c6011c758b77555788d4c0ef4705fc28 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,8 +293,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	return 0;
 
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:

-- 
2.43.0

