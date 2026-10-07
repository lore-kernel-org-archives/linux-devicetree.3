Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD9466B75
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363660; cv=none; b=trWpzTkQ1TSIFTLfmrkR7zJUvJonRAUtDD6DVK+Rsiew2D3zxzWdoUcGKebIh+dbj46mwd4+6ih/tB16aQJ0kZG/D7UuYKpF4YhBHHkHwMqxYCG21TQ06ZwROGEmYgZ1ODTqfyua9WkJ2ZzSnhx7IFBHpGMqYyBW7VIIp8N3Fsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363660; c=relaxed/simple;
	bh=TfE1HXDmuMQX5LOFZmUlH2YF3CEUyGNIm/P5CWo2OHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l/720hXbTl5+qTTpU/Fvmc6RWbsV9khFN5njsfsqsIA9ftidpKQrRzPZXsjeWaB5dR6xwKauri9yQf6XW5LCpx1BNsCsNIPg/ZITF87wy5pZ5/11oLlTM+ulyVORxj+MfQk4cS2Y2JtjZd/C2tK/i3rh1MVdWFP5o05/W+csm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nssRJQLd reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nssRJQLd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgvj3334712
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x4NhWmEecye
	fJPvH2GfE/phtWfDyt95THJZwcognhfg=; b=nssRJQLd6T9/ev1KeguEz0/9p9j
	NshJw9FaeDC1vtKNwt+ztf/kIbgENyEabMP5q5dCwM/hIxSpl29NuRr5JWjP2JCJ
	4FeuG7yuJvKyXXzYHSXCFiBzx8qFMCHokO6cLVkOYK+6zWrcp1nJfrjiu3TowzG9
	MX+NDJw1CAiZDL3Vqa2WCbNiMcOJamMzcujAQ4/y9LIZFCWJEFnyPDParPetj88b
	+F7ElRtPcwgTZpSX0jweAo76TmH1A9wz0l0Wi9YQXA5vp9ArCnDVhWogI/KbaNYD
	/KELTE90T51lhPvd0j1wQyTE1sHJA/t9qzlWt8svx+q/sVgVK00TqvBxJKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623amd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:00:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc5f70c8dso422869485a.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363656; x=1791968456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4NhWmEecyefJPvH2GfE/phtWfDyt95THJZwcognhfg=;
        b=YYHRZvEfyvlYN3O25fTm4Y3U6xM6G+KYyoDuTHjO4Xkwoggvt54uorLcM5VIVIM4Cr
         Jux4Izj9Ia5iftYjYS33Ar7FYE2PTimQ4aUieVYolJ2wKupOcmmuvEYudJYxyYhrbiZR
         3ATakFo1bUs+PnZ904nlFvjNm5h5Xkc602rjHiE1nIRKrYLjMmHu3g99UdwGLKh9tdJc
         XfFDIGTX3O3D9VZ5KBxrfPS4gsfzEfipBDZydXG+b6vgDJmBve0Mo8DASaFIkCENMmTj
         v+mSJ8bVVH4wvAmrGsMLDM7c4kCmsK+WMH+5PRCl0WboULY4sWLc/tI3lFiNK6dKj4PN
         uwEw==
X-Forwarded-Encrypted: i=1; AKwUvBxyuJxBp3DDk6FdZte/7+tvsPBeVpqK4X/barz3z765j8tn78wgvdXLeh2Zp5wpBL5S7unCAvzICioQ@vger.kernel.org
X-Gm-Message-State: AFuF++lv9luqGF/iGP42ng38xlLOQaJ5Mh+pXXaSXnnryY74OmtxXaNw
	D+MAduzE8mvah1hHMQ6uDKVXrcLHhF4c62JuKezhGjUsoonv5q8zW2OUTTTmVo+A5tfl7YBsdUy
	9CKPLA87CyLzQ/WF7PpfgSxv6QJp1PxfdCQRwenykB3MzetFsPsaR3YJWMi3z9ysN
X-Gm-Gg: AYBFou2/C/yDuNhT0BKF10ayo3trUkbC5oMNhH/RCrEQn3mkPcBptVBLpru45p1pE38
	jPTnereZYGR9LvhueJv8AH6GE1c2IuVUaARn3wCmJV0sVuBynZjZQFZb5hV0pIzyQgiUasjUihM
	TdzM58HasQOcIkRk8rEXD3+t/BzPFIOS9OQ+K70QNCxHEXwqRx6OfVDKSx7apstTBtg/Hnu9rYD
	ntcfx2RtC6ZVO591uf1UYciTCtSl66h5T3uSwzxLSPitwMaEZO6wRbvQraj3I6Y1+YoFuoa4M1y
	tPrMGdWUVut/k3dvCY9n7DAJr1YgyE8C+IxjPJ0ZvdWNp7NHF2vRG7sWM20=
X-Received: by 2002:a05:620a:6845:b0:93e:7540:7a24 with SMTP id af79cd13be357-93e9b7c5622mr302577985a.48.1791363655965;
        Wed, 07 Oct 2026 02:00:55 -0700 (PDT)
X-Received: by 2002:a05:620a:6845:b0:93e:7540:7a24 with SMTP id af79cd13be357-93e9b7c5622mr302570085a.48.1791363655311;
        Wed, 07 Oct 2026 02:00:55 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:54 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 02/45] dt-bindings: media: qcom,sm8250-camss: add pixel path variant
Date: Wed,  7 Oct 2026 11:59:58 +0300
Message-Id: <20261007090041.3732717-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hp7Nu2UASqemoG5rsQJGQvoO1J8oXy_R
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60a49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Wj6AohW_YgefuVwW1yUA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2fFjDH2j1aek
 M7XHE7+Txr0rgNkERgvDrv+WgYLYxBAM6g37Y1H0Bg5wrblriUVM+nI5FUNaBhnOw/i+q1/6Bbn
 MnMsTMqghwnFrSOXpLjWeRp4UCBvtYc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2aw+D6vP2Rma
 bxrfsXkxp73VA2ah45OYD714L/7MDQw36ZOjNL6A+pvl/tZrwKfvZq/MFYyDCLBSmSiEAA7+uke
 TTHLoLJk6p3LKF6MyuO6L6XehNlL3z+Ll7SifpV7j3TWk6FyU6zUTipDnzbw1njLeqTPnzbbm/M
 b9ND5Bt2vCGEtd2rEdjg0W3gezK/yY/RSULnjgPnHQXlW/bbG8Rq54OrER8gwGmN8BmKJXsa90Y
 p34AZUigocFY0M5qJJ2+xOPCaAMIV5Pm3gjv+ARLFvq2DjS9ynSBtNcnDUdcmwUiW58+HGw2+wY
 30T1nAG4aY+bmQ22OoHWz5r1omx0UffiYVI8K3hUaEH74I0bqVIoxrx9tfdYHjIcVzK+p4pABB2
 l+8/dtwBN+gUErYAoo2IIYdK+ds+HRu4f4wRt3j5JF8JnGYNa0hLMqGQXxU+adJ62GgKIOQjHZl
 /7hiF3JDYLwJd11xlbw==
X-Proofpoint-ORIG-GUID: hp7Nu2UASqemoG5rsQJGQvoO1J8oXy_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document the qcom,sm8250pix-camss compatible for CAMSS configurations
that use the IFE pixel path. It uses the existing CAMSS property
layout without additional properties.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..d561179be48c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8250-camss
+    enum:
+      - qcom,sm8250-camss
+      - qcom,sm8250pix-camss
 
   clocks:
     minItems: 37
-- 
2.34.1

