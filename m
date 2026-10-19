Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED8A4E4314
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409170; cv=none; b=sIpg2pizBSPGK1rJlqvA3Pxp+NVfBbqTvhZPhWY9c0usSxrLfsS9FeFT3wIE5Jrl9KtvStL0kUBNKUj1ayxod9OOu+83P/pQDKxe7aLO7lUkg85tTI8bIZAVUMOsK1f5r0x7UCL9Sx2CST0m7VdRpWagkwSB2CFzSAvRB1/AOGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409170; c=relaxed/simple;
	bh=/1u112Fp/QaTfq2TFsBWcfozg9TsLnTJMmUIeYDwURA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5v5lfifBrJCtpIUd/9mlDIvxG7dXLJDQZMHXO4p0b5oT625iG77RONh+s84CrNLX3c2MH7EO1ylLE2VrZ3vKE1VI16G2aEhTsCmCNXih2QUxCi+M0LO7rX1/AZ5WI1c0Ur9HoHA8LhIXe6tGLIG6jERQufAXIN4dd/q+CYnWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvS3tH42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtQJ84rs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvS3tH42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtQJ84rs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P4tk1896453
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=; b=CvS3tH42DqGAO8BI
	Rgd088K/7wWEtXO00Pdw3OQhz+id7l5UcTms0iJUwBKSz2CueFMhT6f5Qp2YqDX+
	wVFk8iKh56t/a+kkjScibD1zNqWAJyVMLRxtVFstOxZpT30a4BAcXsSmQEXNdAI/
	ucPj+TPbkS3Z/mylFblUeowjss/ExtZGLk6VftqOpdiQIE4rUFQ9bDy3ROKDceny
	mMpzzIes4BrkSkZ6CMfPucSjR2TRGokHMjyXzb0nHG0GxNlfj8hN0cDItZyzJR+N
	t9YZS2YnLNU4/W27y7DTyoWRtQ4HteJw3KdINk042JNLocKV6JbZPSrTir7F/ulz
	qQng2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9m8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:25:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso398926485a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409159; x=1793013959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=;
        b=PtQJ84rsnRduarOn2l6F70FmOqJz7UnIFjRMH1quk1Grhl2r3zurPg+uiM2oWPnCRd
         QzjgcpOWYkdY2LSxuCX7OwFu1j94XMhP8vYGi5PTjf7yG9jjT5lNGQXU/qYbt/GmVmN4
         n08w9XohAZ3xb0F/Qckr9MAD3nZr+HJhgFDRFKphXqVsqy+f757sFu9wa3JnHIh3QYtU
         6BOD/LrHVcarApuHDpEZ+GujEgtS6GggiR3e9c+2SlPPOwT2akI9feLsjT/+kZLhndRu
         RYBomvawa23xcfYjmi1V/qnrdacjt+BMquJqVMZR3o6oaS9QtnDZQmIeOeKm9FsnITO2
         aTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409159; x=1793013959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=;
        b=y+EAxIqHDWCPxWSFaoLKb5wCdzftOrWX77aiJbxzGhfYN2BbvMXkyLnzqz2ljQwLeF
         qi5JYMMwmkeVv6m6okVa7z0vbnb0xCEW3W9f4tHG9LkPLnxZC2u896CBS2y3feRb0gKu
         5uRXV1C9kT5nMhYmSIBaOuKv8t+luVAMU29tzVFWjOtGyctpTMzdY/MyeMuDDUUYqI0u
         iPTSC3thk+RbXvD50DI6jkxc4HnJMH0QworKcpJeReZ9pU+MbbuiyuG6t0YDfTFAvPDN
         c348UE1mgW8dtNcnY+slQTvItPB5tchOMxsqtFQmwhC5LHNs83Dwhtv3IwLQp91QUUUU
         ehkA==
X-Forwarded-Encrypted: i=1; AKwUvBz/1gaB79rpqUf2idNJg74ypmLnXpml1CDTq+mK/HiFcVjfcy+hy+1TF5q2YBRLmV77yH5zFzi9NzPY@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7OvS2HeSx1nQwNyT+EZ7rsd9gCYzAz90CVM9T+qE8HVuoypf9
	SsyCsFdZs1fxSVjkIVz1CUcBQ7vM5MNYeupHDzBdczPUSk435xM7uBuWF96TxyDvZ/QicCH681F
	z0ghiERMVFW8B4Zyo4ccHS333NTJOLlDl8TW8Ke621aJ0E8RfGpmXXmj/dRpNXf9Q
X-Gm-Gg: AYBFou1RuUzgc9h0B1ibUusYnSDmFWHqx4SZgVKfzyIq8e1Ydw4UKy7L7a7rGYnTy/n
	zykMC0E+8Dug/Oa1P7TWaWAYtk5HvS6Ip77ZuePiGLCpK7HS3sI3a/OKrQXJu83bitZjEfaFxLN
	kKP9f96EXCXXcN2EffCJ1b8sBO/WNvRgHaKGY3G5BTZxw9ktJJNOPhQQMewH4/T5Flh0rGTMMbG
	d8fWXOJCbidhOYKf24083hMSwApgpdF3xVTenFMej4YzNKtnLrtpjygal7w4Pdo/rnLyY1wBhgf
	CYzxXCR8rF6BKOLb+BPsZmLwg/gOJRIIHFjC84oMbwmYJ1Mzy7vOEGsJFxfD4hf7tnUG+Vd6V/2
	KaqEKbEh1NfW/90DWDt970D3VI7o9y0OxVSHOTAKdym0glVDh8u+nIoCZ1m7VtwJ5gcF/DdwcNp
	mpu3FDzx/7/5HU
X-Received: by 2002:a05:620a:46ab:b0:93f:43a4:a48c with SMTP id af79cd13be357-93f43a4a64bmr140650485a.45.1792409158957;
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:93f:43a4:a48c with SMTP id af79cd13be357-93f43a4a64bmr140647085a.45.1792409158481;
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:41 +0300
Subject: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/1u112Fp/QaTfq2TFsBWcfozg9TsLnTJMmUIeYDwURA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f46xEAVvhENHT5/cr5eUC0J1Mz7Mv7VIO563
 Lrnc+EFNdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OgAKCRCLPIo+Aiko
 1UrkCACS72+7BOx9ZN6pTVSh4/cHz0fgq5dzxAulElxL6MTXCmbF238hFdvgoNdU5jtEncQj2Ss
 LIXQ9uOyDDtaw9N/usGH+no2wTcyPDCOo4uF63tPwaqL6it15DOogVtzq+L+8lYnJP2aSaXT0TK
 gYdvgG//oqkXLvJry2SYpNrQ80RmrtbGk5gLa8kA/wCbVnAwQw86P+D1C+QuK+Gt0s72HPfmdg9
 6m3AZY1EAb18yEAkXmK8vTALtOC5KvM7eIubzahCz26PTHU7dE5v5n/B09JcMbEurqn2f5ylspj
 qrHYCo2aLzqptIZDJl64ddZtb1TR5gQwm/ltogPmQ6msJh4D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXyqx1dpyfi9Jy
 3XfAlzA/oMauO+ncZCf8Nx33ZRQCvPBXX3rqoDuyWdOOJCCcaLqSDmAYjXMCvolLCZq8TI8CDg6
 1DiUzhc75JzG/qXLhyUSfjMKA7vpZW1f8pg8djVh0WpaeBWDqDYApDWAvItQfhblJrZlW/BRdHT
 nRzKSfkpum28H+fss4x3QMKS/PUxcVHsniAYLsIhJBxQl8RjYt7evs6dnVQMW3ssQg/w2BFFcor
 l+vTKO3/70HSvhJTBII+bHqOT1Ttg8Ml2En9igEWWvyxHAQnUYv8xr6I8yg9gzwA30uxW06JFp2
 4L9wPKWl55hshWvFWDlUkpYlBSESnz2JFZY6Q07xMQTMSQETLE8cfVZFsblaT5Vu9AaQyG2fHSP
 fMTyJ2UZacTcEYYJJrHSHHkNY+5JYELloa1iqEwIUQgHjlhHacddPzGsUjMFRhKqPfGXTdJq4hR
 Li8cetBHLIu5PE+AWcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX0qkKrZSPRXtZ
 F7yUdBdqOwJtO7LP4WJ2Fp63YA+pfLnmX7wHCosvvXAGDwZl93a2TJINqUopV4PCLFn5KtFNE/Z
 CyksDRs06KRRH6ha7kVyz5nGcw0V5/Q=
X-Proofpoint-GUID: -Hn7sDoLnt3RzydPmFeRYBKJI9UcnP8e
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5fe47 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iSqtJsaWCaQ-tE2kz_kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -Hn7sDoLnt3RzydPmFeRYBKJI9UcnP8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

Describe the LCDB block providing the LCD bias rails. Leave empty
regulator nodes, forcing board files to provide correct voltage.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 3911d6d0d2e2..8d2136d165b1 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -141,5 +141,19 @@ pm8150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm8150l_lcdb: regulator@ec00 {
+			compatible = "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm8150l_lcdb_ldo: ldo {
+			};
+
+			pm8150l_lcdb_ncp: ncp {
+			};
+		};
 	};
 };

-- 
2.47.3

