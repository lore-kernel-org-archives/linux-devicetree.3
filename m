Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860E46F4BE
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984331; cv=none; b=gtNu4Q0v4QczoRGZp2ccEjOOfCGl73TXzE4mppoD8OwGDa5tmxexKcLUIOlU3jvgUi5JWoP6fo3itCZkI/0Rwu/PHCq44tSo7LXA/6JKJ4FmoUKHnrg8womI+wvcpADb+ttLUYeiecA+RCK/Km/9eSaqDniUKa28/LDy3xKJCv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984331; c=relaxed/simple;
	bh=rI9/kjtNsduYBOyjOom1xdDWF+u1HGKFUnT8QwRo51g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MOrIDKkZ6sJ6cEpZXYzNcXsklxCXviZQgvqn37IQCFvVF5TPwvM7ssJ2jQWqnPJghOq/n3IzNofxyZVdHWvIz6G1WIshRPH0qifWbyKpUBdV5/18eUewy9sXkqKEVgyXg0BSP/6njwxnU87Qn+56aBtL/fuSryHIXJ+VEdoPEMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFv/nBI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXYlh4jY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFv/nBI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXYlh4jY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79sZc1624331
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RctFOn8pk1pJ07OhVZZcF2n4Tp1q3uclOz4Na2XKUV8=; b=BFv/nBI4bYId5wKG
	KJSekAetFaXjrXhqhjsRCVJjIzJnza2Mk8jE0o+QcV5c+Gwg64zqKsG0+IoVK1iG
	6n3fBGclHm5LK6yiXGA8pZTDYoCBTE2JsOAtX4QsE9FvaRnxTed/73oGUgcwSM5n
	rdDgrFPPeadMhaoRWope4Rz5YwZcvJ4OUkwVOhYH6uFk2aBUWjmpkc6mfILL4/Il
	rezBIiZCqueky4Q+scr+n2XmBiZct2rpPew9hcf6Tq51DPP+ftqen/sDxsa/CcFU
	PeHimW53tEf433MXDYL6wRgNY9ffRgkX1ginAYF3e8RvxxV8HyEk3DIQeM5ZG2u6
	IUXMhw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsrgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:52:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so61894555ad.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984329; x=1790589129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RctFOn8pk1pJ07OhVZZcF2n4Tp1q3uclOz4Na2XKUV8=;
        b=eXYlh4jYR93KqqqiVX8xcMYq2Iq9NtXql8qqreu1CO3zqJqgKHDdX7fHbi4pJlNMgj
         UlGEEvEqQ2QQzlpfeA86olWAAPlPk2ERd4vWleeuoeuRvcBDFgpY9lZW1o2xrLds30Rz
         eD+ltqbU3EiJi949gYcM8kNoa4s9RUG89ppKdqe7QI03XY16I3oh3qK1NOUpA4rC3aNg
         Ic+caYeoXIfmVNGWC3JNU4erIy8JBm+xEJf+zw7S92kY5vhUcrWUmILQdjSMjr0LaXp3
         kC7J0vIAxcY4JzlPw01p7aXHdzaGBE8xPfAhAh8IItqUb2jq69Q3lUFzOwDTVScezEFn
         2QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984329; x=1790589129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RctFOn8pk1pJ07OhVZZcF2n4Tp1q3uclOz4Na2XKUV8=;
        b=2iIDVqme9bEsWAuEPHykVxZ2/JFhRtHmgGlRjP/S+mQRvYGIohhc/rCOZb+FsuFizR
         nosQP0i55NUbTAFAeDuDokxlf6mXXoA2XZGYiAldv5s3jBF8+Fsmzn3BNM3xOGjsIK/A
         CIBgj5FoRPvD5AsP8WnvWT9mdLJOWBpmDlO079EX9amY2vPrkf1PAcA/aQyTNTIycCre
         ucr47I/PnhKF24qMhnfR4RZI3OLUM2cqUzPs2zFMZfGY1X2uFqhnzYBK8Adj+RUmYOXX
         GvAs98T9lHn3+RUfZ67k7gf3FIxqE6+XI1+GDbHAS0A63qESZln4BAPr675jlOkbrNoG
         +K5w==
X-Forwarded-Encrypted: i=1; AKwUvBw0q7q/qhg5nu+9mBg2BSPK4laXTcJxhS9qS6rskp8YetVyw/3eHMYvhM+iaaCJXMv1ZKpwqN6lZ9xr@vger.kernel.org
X-Gm-Message-State: AFuF++n/EXxUI7p0aYvXH9rZkq82q0/eYZ7udKV0UtaQEshl/5AcpRQw
	mXKaevpijLbnJLxDF+TxKVc3GFu8SzqBy24z1VxLMqIs0ok/3n9KL94oPvANX6S33ujVSxf0a1f
	GV1IhxBLOXKb73IvmgZ3KfcoVSmAcFrtOFf7Hygmtb/WdIFBU49IVOsrd3LA7y0GO
X-Gm-Gg: AYBFou3cjE3U3r6TCwS4YGqWJPtCi6GuOoyYMpA4jYvgci2x3o1897RNZ1GH90CTyZN
	XLw5KoKcqwAbi6rC8KhvD9T1Mh6jredsaDF86DVMGSRuddX2Lnuz+/qA9EvaJbdrNGbRAQlISks
	0VaLtPEtLlVB9/40ZrVO4WKoqEQNwm/KdVAAU4RUT+rvjy4K4725NKb912H4zcGUhl+5H3MoIkd
	ekUAVi58LGptpHXChdJdkiVWMB1aFRjp8rpqDP5lN4WRL0xSnZpSO51oyGg78ozrSmI2Op42CJd
	QcEKHqqxpdScVlciw3U4P5Lh3JVMf04/wTACOdBpd+JP9mAj7y7iNnPxt/n4Zs3epGqLIk/FttI
	ElrqWXxTLxrI/sdGIxwdBjgWiV0uWf3JHOkPx4ZzrA+8giHDbvrwwbfN9g0bJ//LuBlqJEHUkuA
	==
X-Received: by 2002:a17:903:9ce:b0:2dd:c054:197b with SMTP id d9443c01a7336-2ddc0541cccmr97274895ad.32.1789984328491;
        Mon, 21 Sep 2026 02:52:08 -0700 (PDT)
X-Received: by 2002:a17:903:9ce:b0:2dd:c054:197b with SMTP id d9443c01a7336-2ddc0541cccmr97274515ad.32.1789984328011;
        Mon, 21 Sep 2026 02:52:08 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:52:07 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:38 +0800
Subject: [PATCH v2 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-5-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=752;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=rI9/kjtNsduYBOyjOom1xdDWF+u1HGKFUnT8QwRo51g=;
 b=0SiVfaIXtTwDIQ/mrD3eEPIqmj0BEi795TA+eAEy7uyjl6LHgqK5Wi3paiSsII6G2jP+gjerJ
 gYY8EX/AB8eCx4z5KqcgOZNuhbNOLfc1ZPqTinCg1dAYDqXQN4FzIef
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX3UbCLN0fuVlu
 wdu0pH0/Gt3INZIqCQ+cI0YiQe4catmsXgr6LhqEOeysxxeXlvozJ5LPnrgnifO8LzpTrXBL0po
 jNoGcEwoLHZF63oWTmPevkXNG0UMUwpK5nK7wNXWa+jtD3bLSSNiuE+wJEeBrtGWlKIaWv98fdy
 Wn/jM8iuvP0ActrIjNNr2JS1s5kmG6UN4/F3kDxT+fMXqUuxARq1qgFJW3PZSN6K35Qk6G8g7Xi
 d80UiMRZpsir3RDM0NeeIDeLN8P9OOMwaWZfyGAg/XP3NUV1RxUsg8+1fjp3KyVx5BlPGmGNUOF
 TZDPUJnTUianH91oDl/dLdOVkAY0HI+3DV+TO7IjA767ZArmPknMhmNgRMpHiqqWy4rbVRmvaqP
 GCNexPTNLfvQdEwpngbgrPijFab14ykaRiWmvTel2hXtUxR6qDoX931iLfV1K6NGSJZ8pvWuA0d
 zxaEoSxS54YTDqafIyg==
X-Proofpoint-ORIG-GUID: WaIjEsPVsTsG-7f4f-WizueJR8pg1iXS
X-Proofpoint-GUID: WaIjEsPVsTsG-7f4f-WizueJR8pg1iXS
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0fe49 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8ycGgHVmDalfDplNnMAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX4Q52ykjxhOdx
 Bi7F2x6Y4QsVBOT0ahdc/s0KBPRtWyROuB+LqnIvOJSrYKgKO6oZQ7lvNMqdv4wa43HOqjWle6D
 WI+lgRkbq+q1sXWhRiUTYv9Aw+Fk/bI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

The Eliza EVK includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183eac353e833dc2c3971b5a7301ab05..0d8f86b6c6fed16892369b0d1fa9c7a14f575370 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -148,6 +148,10 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

