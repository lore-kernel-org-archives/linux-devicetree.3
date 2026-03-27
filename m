Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AD329BDAD
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614972; cv=none; b=inVCwoW0J+ZveBznACSKCXgr1dbMj2JKu0JVtr2pD0lB1hQQukwqze0fuaEPMjPxt0Tjb9tlvZUe3D9ljPXmQ+coBhc23Fe3jnKzgeBwHsaI+iCVsRo2Y7ZdQv4RPwS2TETj6kHzvt8MaSQEJKrd4776/t8M87JM9CGgD0emNRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614972; c=relaxed/simple;
	bh=eJVB71/fTnMw3w7gp3+mKn6hbGuXGI/5sN8E0vw7xyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N1K0odSliHfTIw8fSEY3GIcr6l/veMrUGepBkJzW2ixPiJXvAwOTyj4T3x1q+IkVf9JbICqijG9aGv9VQdbWvfR1FnqwbhKGN299ISA9DeCWD3gDyKPI8ImMbBNNiwBKWAO7TaCEXWNZDyXe9gzxreEuJghY32gzMezspwTGKsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyMh42v1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjAE0XXS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyMh42v1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjAE0XXS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vm6l1749246
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VXmwSEMv3+6PfKWxStlWfD
	lkjgBUJAo+wcRRck2tJMg=; b=hyMh42v1OSvZo002LnIyDipwUN8tnLNnpMcL5W
	Lz7mJuhNn6By1W7ybMidgDmX/e0RC49ZDzW//FXQQtp0E+FuufpLnQiCRrLkWWqO
	YHxdcLSiHZoSUGyvofjlBoqI55Kh/0TYEEZcNG2zNDhVBCa2o+28TOWQmpzM72M2
	rPHIrBEYrqXuQJpSfFGdMhwwLEYj0S/BwPy3ufpP7TGl8OWWGc603eb2uHlVZUxs
	v1thqXPJABKiiTq5jhkMFYQh1JRjOv7oOhElClBvQ2An7MhNsKhzCiB/mt7WbmiR
	Kem75F/jf2XmXy2nWku6ohxI+P2Iv8GzG9qyyGsj6JG8CxsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn11ae6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:36:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so34120071cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774614967; x=1775219767; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXmwSEMv3+6PfKWxStlWfDlkjgBUJAo+wcRRck2tJMg=;
        b=VjAE0XXSiOP+7Ok3LQPOMkYYhHL6QD/MFya+qIyzlJUrTc84Bb+C9QI9EatyXvQy1B
         Sdch9VQ6OAtJqErtULskAOULvy4PG9KKYU7KIu0ADnWak2eOyeBkfFWI8x+CIZkSozU/
         u84t3o5oQsEjgt9C4jU22IkThIubDNDHFV8TG0aWMdsIzI8UxpjlxPez4ZaRvnicWRkh
         qRksdZ+fhPuY3hJZrf6gDrHldw3KtWHfNyYfE/f6GMwL82DVlk4zjRnHeHChKhrcDWZx
         vDhSuq9A7WtzoCf5Bpd5sz9GzFXgDwizeojAOwKYqIUAU/tkoVflF2mSr+bNaXe/9da8
         nsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614967; x=1775219767;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXmwSEMv3+6PfKWxStlWfDlkjgBUJAo+wcRRck2tJMg=;
        b=qiorHKcf6n51RRoiLQou+V+vOFFe/KlwTbG+B/dADE9Q3B/iGFvmYCnQBsiAUYWbh1
         BN6e11F9v0Yv9ZBP+Q+JPEWmniHlxMm/FpSwXXAML9emeL/Zhp8i8Aqa/PmFHi4OoN15
         5KADxCDum5TsBj0tW3QB6w4TZgo2IUfyDIAmDpkW+fA2Y+G8qMixr8ypZG030AwhPJ1H
         Ao9ffibzftMhgYEe+aioyJmpBDqT5znQmL6iW/zwROM0Brs54fhzgNfBNe8aW/sjKWuP
         wp49sjROv+pBBLmsoVvqzXjAUujJkgw9Jsy/Dqib8leY5e89K6yKz2rZ8D/Ipz7azhrD
         HRlw==
X-Forwarded-Encrypted: i=1; AJvYcCVC52mCrsKAo2tmPaGB+y/Wpaq+LJiQcyLKR+auwATNk4Z0tQXUiCIsGzx2qoGChmnD6XEWQyo4+GM/@vger.kernel.org
X-Gm-Message-State: AOJu0YyXUvpu/1CazhIYJznuS3ypIn25EzklwaprGUce55YXP2x6ycFT
	D3wP2D1OoFn0OzhTVZxojBS0BJe3fC6HI5trddydribpmps+CkCsP3fU0YWoXdbOzUkMvyqd/s1
	J954tEtFtpa4ElReDW894K0E/ONYHV5TFItb+BFlu1rycKdEAQJ9NrFMM7ms+njNg
X-Gm-Gg: ATEYQzxj6cZ99qo5saeju6z9FXBFEBcSIP1kh4rM3u+1W8MhqWvvvlEdXGyQdbSsOi3
	C/mP7i7i5WPoUk53NA/fIcfpTLP6w7G3ELLagV6FRZjVxW4N3DNRswZ9KDZGYE+4qOfM4CmZ2J+
	sh4WmisV40mRQZLR19STORmdyP1CmZ4VdIK4HCxpSb3KLPsckhimZzJx1AztrtAnehR8DffsfvG
	rqsMeNqC29dcEqX9n0ZjI+4V7wcl+5odB+vabjN6dm5J3+Axy57T9XuIHPm6U2rxFXUGjQ8LTut
	jp2YYoD/Ds5Pslhea1ZaCgs1gJiJxo2c/GNdTz7iJalsVvggEMEmTDt6sXecRbJCXvvVeY57q58
	wk9CaFp3jC8tb/8HT+iUSaMq+LhU=
X-Received: by 2002:ac8:5dd1:0:b0:50b:4745:cc01 with SMTP id d75a77b69052e-50ba3979e99mr30843171cf.62.1774614967401;
        Fri, 27 Mar 2026 05:36:07 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:50b:4745:cc01 with SMTP id d75a77b69052e-50ba3979e99mr30842461cf.62.1774614966855;
        Fri, 27 Mar 2026 05:36:06 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm117053685e9.0.2026.03.27.05.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:36:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:36:00 +0200
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK95xmkC/yXMTQ6CMBAG0KuQWTsJrYDRqxgW/RnxM1hIRw2Rc
 HerLt/mraSSIUqnaqUsLyimVGB2FYWrS4MwYjHZ2nb13h5YRrwde6SINCjfHUY/LYw5BG460/q
 jaaKJLZVhznLB8tvP/d/69DcJj29J2/YBaFK3B38AAAA=
X-Change-ID: 20260327-eliza-bindings-mailbox-ipcc-4615b914d1d5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=eJVB71/fTnMw3w7gp3+mKn6hbGuXGI/5sN8E0vw7xyE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnm0ib8QCOuUUjrCjWw/vO7MvT3f8n6rwht0Z
 Ry/8LBvtyyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ5tAAKCRAbX0TJAJUV
 VmdPD/9dpFMCgU8jQcwtih1X8ALKxhOcReccLiPqXQsj0UW4Cn0YWEwdaxrjZoKzB5yxgJ8VH8N
 7kACn7b5n6A1lwDWNXc5zQf7STCJY36zxNY35I+xdWzrB02iEmLM9I8O1k0zTWK09kpIy1hQXQ9
 hBV90QQk/k/JyHPJv5LhYrLaprNdgQ1lf/hB01kUFIxYxPuihpdIQCrtEcBe8xvvOmUEHaM8Zf2
 yYjvrGupWc0Me0nYxbb7rte8GFrYk+DSSLZOoml+HDU5Jku4ISuvmr2ZDRMT7LxwM+IObDu58NR
 MluuPpx+M1D9ZUdn/V2tzO7lv0LKWIOwwtQpc63eCRncQsUTIAH7Xv6JaR1O4q/A52BiqBnOhFq
 2Eu107hdyMasbSz1yuZwSj3XXde7YuYWA21mVj2oDv3UyyQdLGgM9Tll5gSMVLos64lzxPxuXsV
 MvK0hFH8NR+sor8/HAQxiiIZLaSoKQmMd5e+Ijtez2tF2G+Cefrphip13+wPRfusvtpIjDXNw33
 nX7Cxop40dVYwtg1j+x1Gs/Focg3aJvKVuR1AkpI4Zg+WRBtNy5w/PKCkE3apwQMxLnCy5ghN2H
 V0pEAEdp/5Oz0AItyAqIFf6oTuQDjlARFpb/Cm3xDxXoZpNuksncT496BsXzraqc+2DeK2KpsaT
 OjF/B9kF43N/EaA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NiBTYWx0ZWRfX9T3zaiNGDXiy
 eLV01/hHTG8ck4h+sK3buI72pDYYCI0A9+7IzKdqE8EwXw7Xg55N2n0VhytO0RoHYjH2TLNJywE
 44q7+SijvhEOWsGI9uYQ0dCSVcvn8HoV4O2B8QDUonOqyQI2lH+EonOY68Vqmz7KSpeiu76kU/R
 yMKN/VOVQFVn3d0AkOdAOY2CuMOjdzNQkjhG6ZpkZt+q3CWeYsn4MJql2HC3+a9uUnoW7h2xLr1
 96CBBVXD881DCRUI3uPcQCfB1ASJav3urV4Qcjsloe1qjTT0weT6W1kuhBdD2HBdVHt1e2qpRrn
 W8Xv8b/uKdlPai9D30g3mU5JFmu3y5MCDq5f2Og9YI5hru7HogFtHRD5GLbUFfZL5fi1QFvERjU
 Gai6I/acJGK0WLk/W0oix8Bzb3J2dPjiS4h3eaIAcN2Bnny29DR0RazxiloRYc1e9VjldPcCE1V
 IlvZTG00mbVL98tO8IA==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c679b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cRzeL_u0t5vWdlw5OK0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 4N78wJuNEM-ZgmLyHyaLy8XLzfp8EZGd
X-Proofpoint-GUID: 4N78wJuNEM-ZgmLyHyaLy8XLzfp8EZGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270086

Document the Inter-Processor Communication Controller (IPCC) found in the
Qualcomm Eliza SoC. It is used to route interrupts across various
subsystems.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 7c4d6170491d..f5c584cf2146 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-ipcc
           - qcom,glymur-ipcc
           - qcom,kaanapali-ipcc
           - qcom,milos-ipcc

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-mailbox-ipcc-4615b914d1d5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

