Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A741DE1B
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750783; cv=none; b=L2Qt5TPNB8movz5JO7IQqM+PLDWNn/UKTND4NvebZildkns92UTEPKemLmWNGq08yS+S7ipP/7ZeqrcUZOswSHh7Xq/FYB7deMiQae1TJcrYLq9rfuoFzQFu3NKaka4K/p+MXInK4/kPXGTaxsOSHmNRKflvmbEFZIQSzcDHLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750783; c=relaxed/simple;
	bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrV4jNU135Vz9LT2cL+R8Zo1GOPMnxlyfCBbxbGao3MZdsBv7zt6ok8Lf1uep3LX/LWxIaBYywkkvCWha7gmziPggkJjs/6PIiK2dRbfQL+wY7J5pWEhjRBC83KG3JSnx2ULVTt8it7epCcv2u66okNRt/kGntC0Qf92/AOmFEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsKk+H57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9inNDwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsKk+H57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9inNDwx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBsao3898958
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=; b=hsKk+H5771OI9it5
	He3g3qO48bKWwCjKTk57F13lpBTMKXDbRsry1qFscqo9CQORgDq96B+L/xt29p+p
	KaCUQeQez85fjB9H1sjmt8vYsYrwk9ThOSiW/ZmSm6KNk5DgMg227B4LGVQMu1vO
	VNumkbXgSynlrKXipFBhY7i1v0Ex9EwNzt38x/dhE8CB1Gqgzz60CbBigJ9UoNNP
	xYi+prkWXzy3YRTdKb2p3S3OcivPceA09E5BN193wQRLt/DqMoTraEiUDedSujGl
	xJ3y670j4kTl9kWOfvgluQlzZ4iXmZ5q/PV/JXJidtTRkrrYqDIEChxwsDAlPZot
	tE1Ahg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthsax2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:26:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1891711a91.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750778; x=1788355578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=O9inNDwx67oxenQeA5NO4/UQ0/D3uGdgL1nr1RKSnuyXwlC0gwqB4tMQ+iGH+pFE6U
         r/X0/4YZ3ATg3rZ2Q5J7awns3dHx8AI9hA7GeDr1Vk0mtIZATfGbEpE7AkVdU+QW8+IW
         oOyl05WNZ+xQyn2s6PCLfQE2ItWbwyB6NbouB992pN3i/lvEwLUgL5nkuZeuscMoxL/p
         1ibVO5hZzCrj5xMw7dogmmYaRGsrqsIy5VZ55utqNBn5lo3XTt5iyx7A8d/BeNqeC6Wt
         /LBnsEzdt7Fj2iqc+mOd3xZ1z8gN9IB2p9+40KUcAXEY/JVVBesmDska1eYmk8uGs/ar
         7H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750778; x=1788355578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=qmg1e4F26Xcs+8LEAARmgBa040lbcLVLfCER8i53A5ec1AM0YAqoOkfBNY3THvv3kB
         MiwjYE8DipPjs2xF9JR9Lzg7HLuvB1Zvu5op9vEvflrNGlqoibbbEyyOkSIKbfYUT5+w
         kQJ6dbjUiYIlUc/wrg1EH41aZK30JiBksJ3XF238KsuP3nTJjlUcUrDBNaKPDOlXc/dS
         vzSHaOcv0exQp3UtwzVnkkggLBkFizzYZ+ob8dHMYTvHJw0lc6yVaNrFTzXiWtYYKiZe
         KlVGHaj9VNjQynGWeNYkzcv3sNRcQWnbOgreMI6n5N1tFgDaJ6txJ5c8ZvDB6NrZtt6U
         Cpbw==
X-Forwarded-Encrypted: i=1; AHgh+RrWImdlMyo6PMXNW24pRskiDS42gCRM4cCI2p1lfYybHQMNy2gtpd9ds2VKPJ9LyufzNdeFsBtkv8he@vger.kernel.org
X-Gm-Message-State: AFuF++mq9ih75nY11+MwxC5Mlf/8TeEaIicaAyeOkfOksBDOsh2DIDGD
	CnGFe9u9eK8nePx8r47MC5iG9MjDkJgjGjoyFKyllZ4/RMONKQ7GCkWH7NqTNlAHE3U+8JtUsIJ
	szSH83nMGIfsnjpiFTIqHFnsDUdq6JDWsj8jvJS3RQ2UYacVSIspkI+nFhRNRu98HvDI61ztj
X-Gm-Gg: AR+sD10IvENx7eNCF3Txt91TcypgBJcK8d8/5TGEReCTEQru8dU323mrYS/UQHQcy0b
	xSAS0KY3ip+tZoDbijVHpzPW8j2tolbrrv5JlMXM5XfsDLUuaZfGCHY1F9M/cMpBGVHB8cmD9wZ
	9LAxETlS0q/yFBaB4QpO/PyzgBL/agYcEAe0AA7Z6yfPxqnpmKp2sYwuUkmpofVBa0hOLtc0mfW
	767C5lo60l/S8psfS5TwYaHBpcUlzbYMC6C1YhdP1Gt8Qro7SRYIhIGkAcVM0L0muTMjSPaukgp
	7n/fXnxjho6Vgi6v+mKKUBX00c86gWtKKlCNEiet+Wq8i5pMRT5a5q5pxzLPy+qQv36ut3BAo4y
	osr2UFeG448fiaaLtuvnLvlZEwg87kpVzkg==
X-Received: by 2002:a17:90b:380b:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3966d13a242mr13700625a91.1.1787750778396;
        Wed, 26 Aug 2026 06:26:18 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3966d13a242mr13700517a91.1.1787750777930;
        Wed, 26 Aug 2026 06:26:17 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:17 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:55:51 +0530
Subject: [PATCH v4 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dup-sessions-v4-3-35555d2bfed4@oss.qualcomm.com>
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=1160;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
 b=hKxSee3N2j6JpSIoiOSL9OI3eog6VQciN937QQPsq8R6UpGZiEJT1MF6VHtqLnTOd6+nbzI5I
 NdgVHbZYUk4AbjVTUiUcHFN9x1kRhlDqJimg15aDP30ZsTFUanOgEcJ
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ee97b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: UQUyaaKFRazsnxXC8D5W1WtL5I-1Qp1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX/bdS0pp+hhp5
 QnxGKOWV6nQnnRjBx1ftD0J+D8ti544bhopdFXSCbul/Q6b8oZltEkB6mBEY7ulDBDKTFQetPZI
 maCOY1sl5+1DA4ag4mR05Syl49SuEdB6YeJBPrI0A7G+Bw20BXEuqn73GT0goQiF7pYhL7LMZJi
 P9V+27CuEYs3bpUoE/bKMKSaxYEjEN+gyk5qzU0uLo8UEcDC4sGwt3tKSSI4kXGvqFzV8DxYEoP
 YYSH6D4SSP9+ghQzHwuVKBJnAFJ+uD+KQuUDc6FuxXTdaKqxOVo0OFuqDJdOsx0Yu+j6klCWn8W
 7a6pEyd5jykajgY8PdL94P03T3+TcVRKEzHipippJlXX8awTwjww3PXSqud2pIqdWgXe3IxNgu3
 HBI16JmUcyfjkp4ji/ulZ21qrvNSA3D0flyCwElUwyOitlf9tVsO2gAuzrlup+qhGz2JXXX/A+I
 VgFXymXyiq4V0P06kbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX6y816B6Bfr5t
 4NkxxevHbsopZBkUekQ97G//AaTPKtZcAFbL80W4g3hG8c/FOxNdT/x1W46es6Yt62ngducRSb5
 kiXS+WouN4GGrnsA9nm9AT3wq2g6jIc=
X-Proofpoint-GUID: UQUyaaKFRazsnxXC8D5W1WtL5I-1Qp1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

