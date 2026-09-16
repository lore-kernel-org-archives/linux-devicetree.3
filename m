Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215EA34F46F
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537542; cv=none; b=mfW11RjGMnUEErao0HvX0zJ5kv5nKo4qWUqNCS3pD0J4i1D32PKc+lq1CDMMV0/Z7UEyX4hZfvqfi6PwkAhmqHMGUS49xp9HLzOXbFADkXpj7PsOZUHL0KZU6/NChQS13aLfybwJASrQCSdLfnkAqCAdj9FtsVswrvkIbgnrw9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537542; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YY7nAK9Immzq9OGi2y7Y+UkdnKKl2+Yg+10NIJLSkE+84QRX1VROkIxuZ5EMHP3bGdZkhRxaSxWYPOHVi4VTOe0kVCQm0FVxesGeLwgEtvzGJ3rkYeOCQQM4HGZhfnWXZgdbG5cGjX2+qD31SoinqfW0ddxWhD2XrR9FZknExN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0DXtBBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9GZVbmk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0DXtBBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9GZVbmk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5Vt3V3680606
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=i0DXtBBwQGoiqnAp
	nmbE1yp/fGlML0upLbPC23+jatyfuwvUrr+moAnPYT2L577w0+Jgx33Bab/XQvdZ
	ovjipyTnHkcCY28Jhex21Nb4ZoRJmx9MWg4czE3W7V961AWev1HsK+GpaMDYP5Mq
	OHdN/mC08qP1SuavZUvCsdbnyAWZCKwadDGDLNUlXaIbNlseWVU+c/W+MrlCIgDy
	B9Xadla9QyEVJ/ES+6o4bXV+/LzGR2ojn7ro0PJzuJQHq2EgPC9+7mZbwVaNVeb5
	MzIg2TYNUBH308/R1xId4pMcXHVcBW64B0eyaZKpPsE4MTHuIPmZMjLkXRNQg5vz
	Su73yw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9hu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:45:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so4060845a91.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537539; x=1790142339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=K9GZVbmkxkonX7i4iVzB5riEKbkPlwBQt6l0eUatOLcncS/SL/B69lQxmY7fYm2+UL
         Hx47e+ij9u8L6h6kJaMB66VBKcwLsZk8nf+QS4SpwQ0oWgbRxSZtgij96fztS6a7/vks
         yYxdC9dkweTcCtWWz5CwQLLt/jTPHlv1iQ5oopKWzqrNFtVAEtDX2mqAWyULgX746Dpd
         uhHrEB2mtDJ9FmzL/8Al6nCg5mTSb4CU4zsLER1DoEuA1MnowGnu/ONXmyn3Tt9cpWqS
         N/x+EC/rh/vqKmVNzOV9MIZbME8xvjIpKTNeZ6tta2PZtbxRGCho7E0JH9uo6hcsWBjF
         R7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537539; x=1790142339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=IruungEy2rHtmTfkSaH0SekgCTnwyril7FPnr0vx6iQ/Mkl9NUMAWfcC2QI3M8EQcC
         Jp6pj2JyPQSRSEg6IlsJJeZfzc6SFgmAApyFgyQKP8hrhCJn9nJfFcFrPWuX38fdbPGO
         aWHswCrpAUbpcGOHnKVhZWT5RPjPwis/0wGA3oaCNSAdrSkB+02VIlHEhYLpurDg2Dvk
         4US3Gf+YFuJXdWwn3lob5MEfa/WOX4dzfGcbEuySbIOFyi42XDJ0Met1mlvu2c0wz+Z9
         ud9gWbLr+e7Zj8ysO1jFWHevkX21gt5ilrDrCQQft+STn9O1xfRf3tH1WkkBgrut/xla
         BlJA==
X-Forwarded-Encrypted: i=1; AKwUvByRsVeDopxXd8pjOfuweqrEojU9gW/IVGjgliE7zlTmtAvQhi/S6f8inoQOcpTxwnHBXv9l7gQk3Mrk@vger.kernel.org
X-Gm-Message-State: AFuF++ku7bRRbN63LgM/8UDM4RoAho3yCcTV8nAK8zwuKoDAgpgGusHg
	l51cnKFAnYgv41rhU7y22LKGaUcRvChIx47nu2S/STScxgq9DU6nsz8KHMe1883K6WgFi4ynlwe
	koR+G4AuAFye2y1Yknkb8u0ifYryt3jcEEP1L9eDDqKtaY2i85RtZX42ULVFbBjML
X-Gm-Gg: AYBFou1R7QBWhCRxCeHSCcUzm7/KMZz3soLoZWThzPcyY7Uwbqq80apgE/BV4UTcbsi
	eyMrjBplhso9RG+T+FcyrhrrtureQD20Nn8kazGFdCS0+NHNOncZEIhhJR7LTIaeXW7RbRtHFRm
	spHS+01vpM9NWCMDaaBqqBPZ4pB/DR0XyfSFPpKbPDu1F2m+BjaT0pGnyTxmGflNWt1ZH4A6oj/
	rzqfszKCoQ7b9QD25d+/yQE9D7Zzgt/F8IKYYdii8B5YRgX/+8Ap+iMwWKOSUViIUR0IIDvyTj0
	FCz1P57jmqp+3BTNWYPwQ9UrnoEaFQp/ZOMB/oShGgdwQ/v53D6ETejguDZeKjIEdovEFeqDuUJ
	PI2s+got7bAFHQUJX/G199KIsIcahF9I=
X-Received: by 2002:a17:90b:4d0e:b0:39e:17b:a13d with SMTP id 98e67ed59e1d1-39e1e539c36mr2946067a91.23.1789537538353;
        Tue, 15 Sep 2026 22:45:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0e:b0:39e:17b:a13d with SMTP id 98e67ed59e1d1-39e1e539c36mr2945996a91.23.1789537537886;
        Tue, 15 Sep 2026 22:45:37 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm4357492eec.26.2026.09.15.22.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:45:37 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:15:23 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-maili_camcc-v2-1-f30b394bfd50@oss.qualcomm.com>
References: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
In-Reply-To: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX4+MszCCSOetf
 xLza4bDl9hbx7HMTAIplq4ihV62Biqi1mFaC+2u38EHFRGRGaEGwwY5XahxR2UcwxGZRa6mFBiB
 GLFd31uwjMjYKhpEm1q/mVSagf0567M=
X-Proofpoint-GUID: GZTC6V8wOuQOmJSxREltWG7TjaIM1KIx
X-Proofpoint-ORIG-GUID: GZTC6V8wOuQOmJSxREltWG7TjaIM1KIx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX7zo1Fg9ePrCP
 b/hz9oOXgrvQDXbBruDzUhjDUuTxE+CttYaBK7NJX2vECzCHk92TMs8h+jZiD9ko/zXXK9dBvcw
 KLRheJDj8tv2PdA+1Q3p3rmzdJWfg8zWi6HqrwBMyAtJfCp/2EGx/VELYrx946BUwtUdEbr71iN
 J2J6KEVBgn6hhSpyf5cZyBi5jupeYxDi8wjlUtEntj8KLwxOkIhnrfhPh83Awj8B7GYWJTm+cQv
 3banGylbfk2rZ7h33wH30j56y3+ZEe9MbN3wzY6UFy67zBHEIBqx8F7Yk02XLr8HGZlKI/rDUe/
 PsYeFG7zArNGMuT/klLyAmMH53RbNGbxPiLj1WiNtnGUHMfTydetrlWZZ2huKcJu+ORmr05c266
 xSVxUTweyzWpEoS6u7Rb8odfEQv2hqskj7O4agFULBdjjtQY/+6BbEGoxUtrZ71H0prekBK0G1+
 e2uLbsrHvbOCXvsAngQ==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa2d03 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160072

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

