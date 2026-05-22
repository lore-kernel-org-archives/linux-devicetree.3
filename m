Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EB37C92F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470870; cv=none; b=TVmp6vSmWkOdJvuhs+c7Jqhu37OU4DzKdxX9qvFYdBmq3SRvWwEA4jBUINbjtVt6TR8C8abG4BTKmcrpWaSB1uHdGG9SRV+Zwl5c/BHzBc7+fPVlW8UBy6mk+7Ny4BKzAF6ehIW1x55yLifDp9vMfi3q057f+UzQxOjjHvBJ0bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470870; c=relaxed/simple;
	bh=VNEhOKBhobQqQsoEuqNm9mT3JANz2GEoOzRTHnEsEfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9Y0xczhOzWEpjyhW9p18yUHTIEFiOEkdIWTACrdH8QvVmJt9h6AT06QEk8slATBg8bUgmM5QcGOS2ISdhoeAzmb16GHywNwpmtli96FcfI9XE0ToC7rfun+42RnnKztr0nZ0jsaq75+3tbwdVi/ixq84cAIurBFQBh6DUHY2jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTRw7Ils; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQjWWQVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTRw7Ils";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQjWWQVt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFotFE1815982
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqhBDm7fYqu
	6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=; b=eTRw7IlsnPnTflsXgUIXt9mJ1aS
	VMQ+9LlouPD7KBhhgzaT9XHekdEG2oNxzRq9OfdrNhgYaIO2dwOwfTb4iN2t+lZx
	cIVCq8iTBkWOxzczU7X3o4yo/2AK0XiFYDAS/zcG1+OsvEaMfII7aWIc/4bCKEmO
	nJd8aEGmJiCFGINhP5wb/4IHePvPDlwb3mXIrwf7Xad8PwwtQMA60LcnBlRBe58T
	ZzBAJNKxYrvv9W2YV6PGgofF8qRSxUnaDWDOwBJVEWhg6JRFV96+4OLf7iOuOYFE
	4oSDp0J0CbWWNuln1VNR9p8QMzJFUZlcAqgOgELrbMT0yJYrSSLut+Wx7+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm34qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828cee4fcdso3722581a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470867; x=1780075667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=NQjWWQVtPGsFLPQYZRqSQHkVfDyqlEaClNg6kG/zRClmOohjXiiHc8iykW9E8GVsKA
         310Z42qAj7MAAXRZUXB8KdiWlQYOaGa9C3/PgXr1K7dwD+DxnIEXCIIYD+O+doX4OiIh
         E1/wgYbVFBTmrwAANPY2jX7AU0menXSTQ66EPCFWNFvqeioEP+2RiAFAvprasy1aW1G4
         mz0m1SP4p6ba7u3mYIvu8gpGq3DLJvcU57LzCph6QX63F3wfoTTzVbDoGTJnpTrSONH0
         l6tPxe8BF8HFIRhEgGiEbsFhlmnzGatd8SK7TYufcG3nYwFtsRgxOqxH12hlUpIyh2WQ
         sUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470867; x=1780075667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=j6YfshHfu0eCujBegYNIsYvgzMXeIPbmmAHb9lKOJ9X2V9Sb9bIMMnTq+XylrYr9wN
         z2U2RKvs4G+wEP46EyM7UlCl5iQAEazWn+fPTYxJV3Pk2kItOKGhlpXir26nXjhFh0Vn
         /fBFHWGSOeCOt/XpMLD/92f3OXfO13u1BUGmFIsPzU4+UhmIfufKOrx21qQ6j4z27Hv9
         TSd1JogeDYBNKxGqVVn9hWi9lSWxNDev9Sj1gkpWQVBWtH6DyLuo0VBiYWDgqDtdp4E2
         rgXXil6Q/W+hav42wz9/RLDT8G06fj2Ti7BkRH7Tti1Mug4eXApiYOlcaP1hFbtKdkQB
         ZfuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8p/r6/HtZUd69/cnKrPj5XSZK+2+286HeWniIhbC+8s7kmLXvRVbejJYm82FDCSj7NzFMi+FGBRNFt@vger.kernel.org
X-Gm-Message-State: AOJu0YzuH9xIcFpbd6qpqbbrPxC8Lued/V5rijgKnJJHPGdUaU1rj+/v
	64V/P5vELHzIM0WM6y+JchqetAjaVozzDheVBOO4rovdC7GmDzN1pYmZB5t2N5XZydpMu7Nv/8P
	eOkFqsBj5yg696vIBAP2AwzyuTV9f9lK4hozOnGcIDGbCSDC07j8QZRpWJWqBwlhG
X-Gm-Gg: Acq92OFNPSpwVCSsX7XLO4+2JYE1x3Ej4KQZA0EArZIsUbqjhGXZCxjFXuKr5UG7N2P
	cTKGbWoK8snWpJ3uQRJP/hdqldTSmh84Ai2cJZkGixXuo+142CPdAQcadoJhzWqso68rQdPm6z7
	IQ+O+6+4nQoArHCLleJZZpr7A4D6mqizFrf87mgNZNX9aTd26cXXk1N5SmOWHcdKH7qGPehnbG6
	JO9h0XyaTZjoD2bTFiYceZMJut98vtdo2maoFawY0XbAANknSrEVi08bYu5WVFaOSfB1jQ7p2PG
	tp+Kva1dqrLvJxH242MTuHWdnOzLbxnD1L+SV5WgQVk6Kk05gX6mbr4Z7NcaXUrwr/KbPJqeGdq
	7trrf00ejCtp5Z7QdwR1AnLpukAmk2Fufjkkj20moKc1EwcPlWYy6XA==
X-Received: by 2002:a05:6a00:421a:b0:82c:249e:a85b with SMTP id d2e1a72fcca58-8415f155bc1mr4845103b3a.13.1779470866329;
        Fri, 22 May 2026 10:27:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:421a:b0:82c:249e:a85b with SMTP id d2e1a72fcca58-8415f155bc1mr4845068b3a.13.1779470865852;
        Fri, 22 May 2026 10:27:45 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm3045693b3a.31.2026.05.22.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:27:44 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 2/3] scsi: ufs: qcom :dt-bindings: Document the Hawi UFS controller
Date: Fri, 22 May 2026 22:57:15 +0530
Message-Id: <20260522172716.820490-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _Bx6Fjo37nfFSPypSLZXHwjO05gwny6w
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a109213 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=dkR0I6OD3irOzcp_LXMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NCBTYWx0ZWRfX80ZU2ZWq0jnw
 k7p6yP255ayUMRjsaqZYt1QTbl/S7ZsSodsCzHkTDM9FeIQxQ/G6pf95Xj5I86iFdEon5oQe1MJ
 tiOCV1ILeIrAAWT47uVloh//nNehjUH31CzAuer8AIFg9yVgIOLt+3xUkM2dAFjb1JVVWyCSTan
 I/e7D1jokYMiYwYGgJ77TiE5xJ3gglil0HAlbAUV/YJC3bv37sGYlxFJIZEhUYIm0uPYRZJOpYY
 LHPIiMTrWk/DcH0gp5qOuPqi0WNByDvZnzFxKzqLN331kcOuY+V4bXh/EW1erJxef8ckjSOxZPB
 yvpg4XWnMZbB5unoBw9+7WUeYuIuP5nFI3H6LvtPsQG395t/1/WjzOADSnMd2MfwXgrXQFeA0rB
 /IvL3XlgHFIlOospKhb0kvPG5nnOi0rhznSp/7vT2qSOXXG2Qbspt1QakSDMUPi7kfseCBhzKIb
 Fs8linMtDAvq1IkrhsQ==
X-Proofpoint-GUID: _Bx6Fjo37nfFSPypSLZXHwjO05gwny6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220174

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document the UFS Controller on the Hawi Platform.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..3de00affa4c6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -27,6 +28,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
-- 
2.34.1

