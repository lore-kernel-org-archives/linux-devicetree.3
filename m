Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87063D170E
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600281; cv=none; b=gwVwc3xsRHXtPLVAqg9Sd0WctIqGD513oPGWqrrSD7v0EgJHYM+gNHRyPlhsrx90wHjviL9APRQ5huCXbYWEIiNiGHpHKUvCflDsSAuGeZnMAg4FJshT1i4kiOa/gf7b6m2eXKqsfMi3CDobql6vsNvnK0c2aApxUbsgECpcjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600281; c=relaxed/simple;
	bh=D+Jzq6Hk3anOBrzgNu5fk936OVVasAzMl4XnCq4SiEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rj0YAvNsInSWD1YTdOpJz7GiCgNbJ8VIgHYSQnMO/VXIpo9D/ajXfvcVvCO+u+eJX8IvUIB+A/aSJvFnlDHHpHx7tzxEyeWuWKxKV1+cpGawGC9D9JoGGJuPj7T2t7y+lU1yZ+uzWdwIEOGeXMp+FAve2/AJ8eSx9mXAM7OWBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9jnQ5WC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoPcxhyo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9jnQ5WC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoPcxhyo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w74W3132203
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rYEIaaerAbK
	eFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=; b=J9jnQ5WCEl9mTRNEOxADy/uwTqj
	66wP5jD/yh2LA97ybP6qP3BIaUOd/CFwE26zJnWXa70U0x3knrqPbDNuqQWR57+f
	thx9jAtDTQGlVlb988DW6JraYN5oFNtrh7CHs2Q4FuBO//RCMLNGUYalPAH58Sez
	iPr2AE5ZgiUfDfnz1UNk/s8wWdndG7ig7p4q0GFxyyyH7tpYo+U6YQTkBlu/Ze5r
	qmNHNPFI6+07CC7g7kC2qDrcGEGrgyVR+Mr8ZTs373sdK3rIErNII7Ra7FPib61g
	Awr3hGkMMAXnGHbTJW3cLKaG/7UksS5lko8bg8VByZYHZ5JnqaKp3jHL/pQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s42m4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a0998a441so5992280a91.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600278; x=1775205078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYEIaaerAbKeFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=;
        b=HoPcxhyovL3H+1y0ejvj3secqSLsdBKx3uYwuJpLWAHZKMMewVB6L7hA91nyvU4ktl
         oPuv2MPjec1azY4WVOdCGG+EeGJuwYO4r1kY75VJYUJq9m7CMEd6gL+ZLLYG7FdbkzEC
         16xuRleoPYv+R4MINqBWhX7e9ff/ZDo8wu6BW/TlJCWd4tk0z0jt5ct0gtYW06QXVWTM
         8LSylJAhwhoIY7N+rbHvvUq40UDmONKouEnYpqW38CFtDxn5bl4onTa/z0VNh9YKt/C7
         O3EAQioy+WvqN6dqZIILiNHOO+eTRLvX4MeFEbqTo8LprHle5bxfxzCBgNQT6c9Ir1iW
         19uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600278; x=1775205078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYEIaaerAbKeFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=;
        b=oivjipb2CiapRyeiKPqPgI1DOLERe/6Q3eiW7nM//5QYEOtUiPf5ACHatA1tI8puTE
         T1bjlsW1rEzJAZPEJ/hlv0JkIi3PIsCSScHMg+gm6J/h9/9mbLbbv3nYUKACJOkEejqa
         aXWDYzfKssjv2Lr/lc1KcUINQwQ2NHhen9185b1ctOi4D1pT1SNDpU0schl+xLQI51Py
         jK/flbfeMgtiNtqNMxsbo0EvdYzmTRx6DkJoBxWvFAi0RZMtLppHyydHSdlDMMmpGzge
         b5tfF93+K1r2CAaQ9sS6CLP7zNQgUoABoN5PoI4gg8NY0aW7Ggr9RBOu25Xz5pK1y7mD
         uhCA==
X-Forwarded-Encrypted: i=1; AJvYcCU3phPyTIxcGMt34349o2fs5smPt4cJ9pcQh1NBSFgZ1I+rgx9Cosz4fQsQHeFtqAtCxijrUiormKY1@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCz7BcRypwQX0n+VVkWPQ4iVtgrYjCz2NRR2NTB7NirsqlfPh
	N2j+3uTgVR6cwDESPpo4XEGJ6Vk8UqUsE13r5i9dHmNGLdzmwe3swzHNkxC5lNMBZmBJcDDIWqj
	ht3TIRCpiylyfaDXLri4uWqF5bdbAF0+DLI8q7O3HI0MVg4aOKs7NYisxMozJOSRH
X-Gm-Gg: ATEYQzxp96WMQ0fiDBLlzQ0J2ajIVTd8NMLVmTJAOkZ8ahZZeNWsaQC9mpSL4E3vgtq
	qTIvOCRB6hDkP0O/3R1hMkeXk2TwbHaen5bJHfalOQrXI39fdQX8TfW8jKhhZaqqW/jTwtec0gv
	ZtWI+B+V1C2AJR2oopS9squuNktzbbi9txEnxyczGl9DXxjiqywo2sZHPb7QFX6bVPpzF8UplbA
	9003pHXgUkt9sHGOM/sUg2eRzQGu98PYatTG6+Gvez/9K8rVxqkkqJvCkgviqcZFIzJ+dHmZz7I
	5ZmCJpjcqR1JzI4R5PfXXPMM0sCDkqcrAOKowG+FGxBJJxMN24GROSHJNYrthiOuN+1WdkVQ4Nv
	vQgowzDqZ84C8/ddnbs5GceEtkqpLEHqXOVSJS1cMKqu4nMni3RPC4nxetac=
X-Received: by 2002:a17:90b:3c09:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35c300fae56mr1675037a91.27.1774600277812;
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c09:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35c300fae56mr1675006a91.27.1774600277311;
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board
Date: Fri, 27 Mar 2026 16:31:01 +0800
Message-Id: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i63FK9KQrnP9XQYD7QZv-rguj4Rd3_Dn
X-Proofpoint-GUID: i63FK9KQrnP9XQYD7QZv-rguj4Rd3_Dn
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c64056 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6NDkWPVDNjMa_x_Yup0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfX/MfL5fpqJ6PW
 AhfkpnY/9KprWbKguHItmsioGnpPtgH0XnXr0OO/w4EBB7RL18LXmvhCI0Ym+awprV9tttW+z9o
 mqaEJ6aDF7HrF04lnaCcir28JvpkV5+/wqaFrAh50Mn/ab288rVDh78AEuDemIM+poSF21YqoPv
 IXHiEkaiwO9qVwhWywTRv3M3Ici5bDPEkUA9x3+p8wfWwx9gXnwwDs+YCXftkaF+pPXzN/Nqibu
 G7gGwsaTgba+UNlKbOIoUITbQh1PhcF9/87q59WR1Q5hricHv1uxg0VP+J/ZqLcWnrf5RNTuKBj
 vswDB5jddsUuYR71jpwnBATkOEU5jryM59rtiQZsPbxFQlUpU40Tl+MWtWERDuyuzIdO7mBodWs
 I1Gra+YknB9ykRp+cVMWAI5SAD03r1/8qHXqBpYuMmf5gpJ05XCUC7KA8gt75GKAwrCsTKbNFrb
 hfREo83N5wkbgVYazIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270062

The monaco-evk mezzanine connector supports a robot expansion board that
requires UART6, which is currently disabled. This prevents the expansion
board from exchanging data and control commands.

Enable UART6 and assign the serial2 alias to provide stable device
enumeration for the expansion board.

Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 565418b86b2a..0b26861eac02 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial2 = &uart6;
 	};
 
 	chosen {
@@ -572,6 +573,10 @@ qup_i2c15_default: qup-i2c15-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.34.1

