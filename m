Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63186483BFA
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848820; cv=none; b=nJBKL3q4mw8IvBt2yH8IYfnZZ8bhdgWn5lWCMvSnbl0wioVZABrTVzHUlK4Lny6dZmXHPsEjJT3tabp6/U75kpxo+6oSmA9Tfr2XMU64z8dhbvbRUpaJRYpAGOBZqyCLUUV7+hs4mSajna7tjgZZbs/MIa93Dw4labVK8loEPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848820; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NN1jn5Gh5jopPonCJF5UtBJebdGsPQ5jeSndiSkyHy1vNWLtVo3Ji0i3AaLXfsqz5oealwdunreoMCM2OFmKqezgtuHy5C9JpEVY8WdbFmhKRldg61wH4bY5EjqRz8v1mPBW6jApEf8qTiAg90KbzWVweenqrzFyJNAkTXOpFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8vvVj2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1RnM+Ai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8vvVj2v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1RnM+Ai"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc2l0866777
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=N8vvVj2vTDZzGwDP
	A67C1JtkqcTDE53xyqIRB/SYAAMWMy+LHtcy8zSAN8PY7N29uUmX0BftGy8MdN7K
	EGsCSXD3ROSR9NFgNiMmJST28GA3MV6h01b6mlJQw69l6zmbhNWZz86bHrgrTARb
	Za2Twxone3gG/EmKGplJ9HTEkfLX45P99ffP93JTuHFnRYTGSNojLt4T7c/l8YQS
	2O7SWRYpBFVuVK41L0YtPBDlGLIfXXebfV2bu3KUHCdu5e8Tt9Guwc4to6sq9ULF
	WvWlXfLLed1KZ3r7anRbhygqYvy1GXjHtI0O1Dfr/IpkdFhP8EaQ3SH0THqqz+0x
	AocL7A==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8rj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:18 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f1da5e5b06so135535a34.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848817; x=1788453617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=R1RnM+AiFb1vvAYrTfvpkLn1oDos1NnS03rpGFkK8D6r+aZ9uMxVgki4YbHA5D3osi
         OawSqXBptHGVAom1hzf1EHIYW9C1jQpezWHU15BhXdwVN99g86fmnRX517qcF2lOJ91q
         9pbF5S5sGAu4UhwYASO73myal+/mPanDXcW68HBdTGZ0BSLVYeJ35XykT0UgxQGZhaUp
         BRvdHDnvV+eAJGBtQ0eggZHKie1U9yCuxf3kNyRSbZ4d1xufQ3leuKiaOeHhG8Azb5mX
         Kq8SDRWt66cJAyF3ArRb8F3gbxCpqF2j3yc3WSzuL5e2RweHzOUvSOhHsT8Ye8w/jwwa
         9zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848817; x=1788453617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=HAZ+qYOhCY2EepixwzN2LZo6Ng4wi1RaH5UZqICcGZ/pZDHe6TrGA6DTYKShKspi3P
         xlF2+pgM5lh1RfRRLRim7JPGepkGYGq0giZIdc/f/Rk7a8CwoHt5gaVqc6vKBPA2rMC4
         M4FmJwvPDhgrPnucGVjo6ZKEzTirrxAjXcSHLN+mB69s6+z9SZtlzOyjwi/stHjRgNXy
         6Z3QKFVPVT3SQ+2ELHDTapDjYEnJpKeb5l3N+qFQV58QeHwrIawoaaadSf4rQzNEbBzz
         IgCRkjBetJcOLvJ6IDlDBSDBktcHFHdzJYuxjcQZZAfDxMjFsUWO14yo8xui5ErwTubn
         aLZw==
X-Forwarded-Encrypted: i=1; AHgh+Rob3GDvpEcTZdCP68KwW0R3bHwuF+8rjmYl0U3k6u2RYg4xShOVt5zjdAgdwqsoqO/jHwIHLSxFzAqO@vger.kernel.org
X-Gm-Message-State: AFuF++nzLM8krZG4KAVAN9yj6EwLC3piTMCuS5OoByXUxDYk3ZtcD/SX
	VW/tweUrhxR66207SxZqI6VLnPApz/VM5VM6nebE0NQqI+hkfgJlFUpsV96dVHprWUGXzL7JQEN
	saHtOiuSQIomIDpsLk19u//p7zpHaoIP9NrzON/+9hGN/BKupR1y3Y8eCTWRj6z/N
X-Gm-Gg: AR+sD12b1LTuqftQgwDNZl1cOB4gwTj1mGHYGbtFzLFq7fJBN4fYZvGn7DeOWadEGCB
	umCDWS+Kzv+MLTGNA15nKu+H884WcWu8lO0Qs9OA8m0jD3bBoRbJt7GjnvXI+zD8WLmRDRkYTk9
	kNAWOVLaXKunvPhIALLvsH0ZFfq3Fyo1f8s4dFST1BhVTbpCtCaYv4VLxFwk+P+8aAeXYU5trqf
	ISNe/4REWMOnYbbsju2kBkewBNR5QOYqem20r+OPSuhnmXXoT6Unz1yvadXeIkw1Z6N0crCX0sJ
	JI5FrJZvPtj5DHD/+dKsYwblehv3Mg5toQt2r9GeJuHG1hHL/6N+wiuW7gBhLyeK2M8+YiBwEeD
	LmvIFbTa6iJ/VECEeQJTF7oAGV5gpFv+7cvcLv66Tex16IJrQ3jk5aT4SO/7MgFe0NEzdLEzeNr
	bqbILWAInaJQgD+h2ESrL5aso=
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261540eaf.33.1787848817494;
        Thu, 27 Aug 2026 09:40:17 -0700 (PDT)
X-Received: by 2002:a05:6820:179:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b1a052926bmr13261458eaf.33.1787848816972;
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:16 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:14 +0530
Subject: [PATCH v4 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-13-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=FzE4Q+PBujlIxnBIqlmOr7wAj0IwjS7m5ptJ/dDcSO/NJAOnDGcge2UvSXP9Ldwdg4J2npUQM
 agBO9OVl2R7Cj2H8FreXT0fPbuMGanegKflD/GG71Sg7ZNDymSJR3cG
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: aAwCgDVVDSdDlPAM6iBpDz1kR5glDc-8
X-Proofpoint-GUID: aAwCgDVVDSdDlPAM6iBpDz1kR5glDc-8
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a906872 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXwTJUiPXgtrfN
 T+f4vSYwJgdueswy/geHYzds1An/fHAzEzP2bv6R54dfCw4ZT/XAbpRx68ImRanVR4qVdU/r4br
 xF3tcjE209cwKrDBaqXJLfLJvQaTVNOc7vAFSC/Q3XwwzyDqbPKQCe0m+NinwyaJKvTa/4aln0B
 T6JtitKcZZ/UsgTNQSmWLvBq4Ror2BiitB+2JypZv+L5gMr6YTeuT3SJGJ9xNFJcTh4qy+rFyeV
 hcNxcLGGdhRzQ7RqYIT1f4C2HqawZNHR8j1IJwgBx3KrqRmDYHNpG/0O1Wwr05rG1/b9jHjjPq9
 1zRGHYSQHzr+C4JPQiCkw2jGvzIJbygVOuZ1dmYBL0+5cgI8f1pO7iRkoIAIbbI78RV9Y+Wu2J8
 3nXYTJkXfZPxxOgf+L+jwEFuF8mSBkyhlpwGCS3LtO9LmPDtD/hQB0ExczW7COMmwGrXWcJ4zNe
 TfafSPomAEQEqgIB5Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX+7yC6Aahe4HX
 F/OeVGYkONmbYSrXU1RgYrUr1VonU0YPizretFZu+KToniCYokozhUMY0Ayc5loC4r6WZI/aupL
 59gyqLiIf57LjQpzHdkLNWPP0MOK+CY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

