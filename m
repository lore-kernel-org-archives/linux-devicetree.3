Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036713E0251
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910221; cv=none; b=g/qBS04Ac2NqJoqFo3T9RuVGO4BIkWb9Eihp9eOq3eAP4OPBlDzh6IZNuqCh0XImjd9nElZN/zQyUYpbu+y8D6ZbsDh8wWfiy8kInPfvZhX//zih2u+ioQFno/qHphWQT8+dj4uez0yC0VRP/cI/83EudkDTISC+xP9FPYcK0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910221; c=relaxed/simple;
	bh=1TzDs0lYvZxpsZVJPWom/08zYwvLIb500hfKlQJ8M1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t6J326EZZlO7bqEDUgsqtZ3dryl1PbGySOwGsfL7Qs43ryF1OD/YlUINUfY2bwrLrS9Yp+4F3C4Rt2wR5E8wjUcBvB2muGf8OZZfLgIMVE34fKiAs7ugZqKzjzhKM7xqnPVixMxLlqmck2D5DgibH47cErScTZ/QMmswVp/QMP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yc5BTDa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AuOx8P44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yc5BTDa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AuOx8P44"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B466s635993
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 15:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C/gjyQVrrflgFQzpq8AcAg
	CSqM0GzH2rGpJswoEsDDA=; b=Yc5BTDa8dbYoZel68kviwYbhZ1Dl8JMqhQO6GY
	glOIxifhc7bTpHo7320VH0FxUy63JcbQDRJ4ZRjEk6K1ZcCvpAIhfPfDx3ldp7R1
	NunTqedKIXAK/+VdAAsOXPFtidIG91q9acIX2rvn7dLO0YTFVz/Ec3kDjJZe9zoN
	90JpkI+02VFIQZonzhOAyVM1K0gN9xEHw93+3OYrXXS4/ZQBzhMqGsYy84VvD/9C
	anWjtA7sp8GXwP8Lq2ktkr3NJb3+lzUZUUMPmS13xZDdjXb6ozy9Ohe7kEBQoR0G
	nA9LGv1oaMZ+PTWyOnMLlPONDLxJdFxnWjygbTiY/jGbYoRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx4914a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 15:56:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso118118391cf.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777910218; x=1778515018; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/gjyQVrrflgFQzpq8AcAgCSqM0GzH2rGpJswoEsDDA=;
        b=AuOx8P44CkBY3sMxzAvlScd2JNhnguOsaD25lImJavst0BiAzyIhiEAUpBEJAlX/1W
         Q7wu7ZpNW6/JL5CQKDPQ3pfykLxpDirAurE1QhXMN9WWxpPEOxoAySX/anc7NhcZy4JM
         fMdaAvpveshTezCqSTPaUFhwjW/LH8TUqaP3scPSfJe+HpjVjNLZ1kBGanHA44R+K+gS
         kmonLNDAM+6l2PJZ0nRkSddjLYJ5I6kxQbpYab+OLNlPVcOrp8NP4RCYUotZdXQNCGZr
         /KAt8KP7k2d2dZzamx1S2OoB0F/ekkuKhvLkuF7x05iKDm5wFz9LvIDC8d9C8g8yrdNp
         bbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910218; x=1778515018;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/gjyQVrrflgFQzpq8AcAgCSqM0GzH2rGpJswoEsDDA=;
        b=MXobZAtgdoz1w+/QpuIzNc1s7LB7evZVEKsxp6pFSNnjGEtJhxzuA5NOYWrj4sSIP4
         JH3Gif11dUYO0DJBhWdPqwXJtBtUAkZDhWt4YInPP8W75cVggsppTmcuxVoJMNShYMWe
         8g9iXLw2XBv/aRXmc0OSjTlzqXcWqf+yR7FLoJXTDoS3FhhvwKflF8iIQG/kwK/DNuLo
         gseBp8o0Ltqk3s+XbQXM3gRQjsgYB46VSULuE5n1l2Cvr0PKP0AK9b2wwkalC+QgP4nF
         oPSpS1ecYilf4WUxpWuPA3M6SeaiihvkyexKPyUVmtTy5hbvwRKaUd6RbB3Thab1Y8tZ
         +yGA==
X-Forwarded-Encrypted: i=1; AFNElJ+VuB24uQF0icvqPspdcvL4muaf8oI1yve3W7TmR+5OBhQyrrNYacQwuEo7/34Tsy+sO6MYGBjqdqCF@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7CbAQQwTkYaTSuJ9WftB0uw0buw89GABvAlx+FcVNyycIBCH
	IJbPPpACDX1Eb5A0r2yVDqjCXVnq5tfSgmG2LqjUmUrXLIDOIJLjrTK8OTaVwwBQSWD3IhtK4ke
	MddeehgBcwSDu7zR2T9jnmNoFDT6UpOYC4aIPuiUokJhrGRw0w5WGosObQ0y7+gW4
X-Gm-Gg: AeBDiesinzShGW/kxNHxwi62nhNRMmihvCZMfRwEE8dFlXQkLNjfRVzPrNsp1+s8YRR
	JPewCvqflK8OWB/CyTg6j24wBkefqDMU63AkRBortNcwd2ur/nvLGHYSerq8ajLh2z6xCIPPbfo
	qgsaftmMGaAxtVQ4FO/+vZH8/k1LqR5G7GipNS+nioGAJr50isdyxGiDgaYa6juwhsgk0HUB/Xz
	xXBZDDnB7lFomYV2oJUb20Dwv/+JTrF08/FBoWJjxZFkcEHGEDVDaPYe6+zUv4xdjk2WHvsqGTt
	RJh9Hk69xodLT/LjqeujerZdWkfREHYeJHE0CccBTAvybPYke2lWS1kYYQckjYmb1Q+4No+wmuX
	9RFhrtpatf9wXcIHm0t3+KaRyjAZq0sIuhBGS7ZGg
X-Received: by 2002:a05:622a:4c18:b0:50f:ba44:ce60 with SMTP id d75a77b69052e-5104bf0a27cmr149462081cf.36.1777910218190;
        Mon, 04 May 2026 08:56:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4c18:b0:50f:ba44:ce60 with SMTP id d75a77b69052e-5104bf0a27cmr149461461cf.36.1777910217552;
        Mon, 04 May 2026 08:56:57 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ebc4201sm451117325e9.15.2026.05.04.08.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:56:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 18:56:52 +0300
Subject: [PATCH v2] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza
 Always-On Subsystem side channel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMPB+GkC/32Nyw6CMBBFf4V0bQktAurK/zAs+hhgDLTaAaIS/
 t2Cezc3OTf3sTCCgEDskiwswIyE3kWQh4SZTrkWONrITGayzHJZcejxo7hGZ9G1xJUn4qdcFUo
 fGwBRsNh8BGjwta/e6h/TpO9gxm1qS3RIow/v/XYWW+7/wyy44FVmm6pU1pRnfY1u+pxUb/wwp
 FFYva7rFz6EMFPPAAAA
X-Change-ID: 20260327-eliza-bindings-aoss-83a5ab4fee15
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1TzDs0lYvZxpsZVJPWom/08zYwvLIb500hfKlQJ8M1Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MHGnCEkYMiTkzFzUCnxTQPx2XKKHPNgYNdOY
 ldSabQqUU6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjBxgAKCRAbX0TJAJUV
 Vr0gEADE0WODG6puWGdboa2OgA95G5fvqwg7v+yUUK7rxeUMuKXPpDIDf8mtohK+lRXvdSqtqLf
 fJ+N/1hsYio1ouqruZAgY9fEw2s4pWJrzNqXlc3d3509aX/RDNiS9RoE39/2NcLsF1wukGvL9iZ
 H0Z8dqTK1JyXIymXrI8NkW61hPLBQVT181f/v7UYTeJdnU3OyPBgk080ZOtmOrm0XhNgKYDVP4C
 Wvv66KbUBMfhzRA9Ul8Ovo8GThtpUDVDopb+mvY8ZNqc3PYC4iDNEUJi/9y8EhtX1/6+LgMZVVC
 /XvmnlloYNVOf12tXimOmtxNn17RCREkBaN0NaP8vdqQVS2piKBMdSb2+zof879mcCY9oVx5k9/
 IPRWgYMbOoRQ2G/LY8oLIK3tdeYrscs8YqpuLJL/2GctLvio2NzMiqYO6u3hbQe/u0qOycVLbgd
 /3OOSCEAwMUwbBVOzaVXJeLkbMqdATQ4VBMiE04dkRIVgvqH0vQ0PqfihwtM5n7qgiSkZydmpdi
 bS4SlYQRJCVOmbuGNw5cUx1FTLP1ELIrcXmuUCkNYrSPQ3XO4iH7zrA4dWDtvl98zROnhZ7In6r
 LQCtWAydjn5wId5ttfb2Sf9fhPq9ZI64vqFwYfKYEQBE3i9W1cmSqYxMwcFKRr9oGW+z+Vuwwpn
 YpoF3aEbspQLPIw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX4mUYiNMiCZhS
 1p2q/hA0hValu7sjuZ6wYwLNiKbLFgOl8VQiZ3NOaDiBV4oMat1G8UIuiN0ueXTxEb3mGs2luZx
 zzvPma7EQyA6e+T+pUv7revfBnU3oMIlRTdlJmFqxZxwHl3ILkMq+/ADfZBXdfw6epuv7PrOOuN
 zZlEXpHXVwFyBw1oLDVyjmSTsAUp8Sc2l/Vl4/VOBAmrtVx7rHxXLm/Yx+akY2LRV5V7NcJ3c6W
 WkzbSR2FOZZAFGDPVRtdzhh/A6EmxBXrhMwoZFvMWqXxEr8ATC+aABlrY3wg74xSPlAp+1zf8bz
 skufNjrSadyaXJkUq7yEO8bHW5M36yARmm9SI9hJEy58lgJPOOhHWy9eiXEbaNsT59+M8WFXx7L
 KblrooVFedAEbaL7ezZkcQIrLM2yqpc+2fF4RO2KT/GiVJcagK6CZfrOxZojh985MSZGOGYQdj6
 tCY6qCWG2Ddlz4Dbemw==
X-Proofpoint-ORIG-GUID: EjjTKv9HLH5js4NkRFaHi9nxqgxKHkXj
X-Proofpoint-GUID: EjjTKv9HLH5js4NkRFaHi9nxqgxKHkXj
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8c1ca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=O67gKX8sZhZfn82j4YoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151

Document the Always-On Subsystem (AOSS) side channel found on the Qualcomm
Eliza SoC. It is used for communication with other clients, like
remoteprocs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260430.
- Picked up Rob's A-b tag
- Picked up Konrad's R-b tag
- Link to v1: https://patch.msgid.link/20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index c5c1bac2db01..8496d623c621 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-aoss-qmp
           - qcom,glymur-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260327-eliza-bindings-aoss-83a5ab4fee15

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

