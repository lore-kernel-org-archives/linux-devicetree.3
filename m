Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483434A77D
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137703; cv=none; b=PpCklRShSIvgKoZi0EtTm+X3xbySajWnftNz8Y8inGHL212FJpj8McJnk+UUtJXRzSiNlWz5pMBxPBoUWGwyCNGAk5mXR0nyhgog4uiXy5zEjaXCWDXwYCk5MpBMUazxhpGx6+Z1oss4iRFL3tu/DWXiro/p90JWxxZQErgWef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137703; c=relaxed/simple;
	bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/o24ZLQ4ROi7qipPHxg6CRFOIeAynaOXXU2ZjLXrkXpW4cL6xjC2r7uEvWhYYvEhf6LfqY0GzxKpMux1EYYQVdmPxfjnmMjk5mjYUpKHvxow6DG9ct7vJt/3236fDiwAp+2W1D+XkHatHSdjqRiFjr9FA3xGJWbg4TFWdXrjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N45eEQEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdtfTSNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N45eEQEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdtfTSNW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eSHr026471
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 07:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=; b=N45eEQEdw9pIS0Z5
	eUD9RVMc0SyCILgyB6fbwC7ZrsGaFqryR5FkjWvSZnwXBYVq/MU+iB01GgdvT7Zd
	CCX6sy9vYjHvVT9UzeYXKoaXPZ9nqAJ0O3iI5UTV2kp+w95/BZ6k+AqYlZSfzYdo
	84pYPQgqpjJJuEjm0+b5nLvOiOdb5auu1FurC/goDLhu3StJLCu5aMeBUjEutX9r
	yv0gX5D3H+fiG6mSYOGPx/P/E16Re3yP5JK4hmx9K8p/pYtlFdO893yzCfo23xDX
	BNqgTDT08cemH5rw3H1wheiQJwcWRlHSJlrK+i4//SlPJ8VByam+r2FXTUnSks9B
	G5UyMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0n71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:08:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so7927671cf.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137701; x=1778742501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=jdtfTSNWujwtlsFQ37PMZBiFjSxXsuN91b4dxj4Eopg4q83CQLePZnBNI+1Yp0iQ7E
         zRQZ1Ebw0ttHPuhpXDZQLE1vsucUgsnqqBOBO23FzIRkzeFCdtT6EBDAQy2CQozVAzq1
         hoicPER8peWzJV1rkoA6i61P3YjgjDixiOmy9n1k4AtydXfS/isjlGUREOJ78UdPR9vy
         dtLCAGqK5YBRku8YlF1TX2GEcp7Cs2Cj5LBhHUC2ACpD+2aUTnjA+p0Rx7cb3/Co0uNd
         xIlx8n9AfxyjySfU3+bt4ixs3PGFGgXWChIRwbmQ9Jw3rTLzdSCxz2gYo6FZytwZOq4Q
         tYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137701; x=1778742501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=b+9CE9q18/EuCNfd+vQlQnoICUdh8Y4qB00kNa7ZMACcFmHyzrkf9SIsNfCQuCCQHo
         +ZRkuFvgfHbxyW4zsZnb7T81wuiubT/33VvJ1yX0v2sc4qlBK/3PCMU3gONTgbcNwLF2
         Mkd/U+88czJ9KvYebBKTeTd9e4HdnyrqGrPTnCiIUfbZoekQy3Iobyk3r6XcAqh5bz8U
         uetGLfev8JCQeAfyW5CDq+zFGDh7asCEFIh+USFBk/MiOg8I3oY70avcgfDnAk0L5i5l
         R9u7EoGhgUu5aFKmg2ZHqS3fLHwAPCpBRY4enBQxTbHToiLUmLS5Ib1zXfkf3FLHU1vL
         6YMg==
X-Forwarded-Encrypted: i=1; AFNElJ/VInURPSxnExaQQf4WK9wgvvi0ucCKqykWvDghPKjIBC7brzDhRx0N+difLITjSacQwNQLNAt7lTvy@vger.kernel.org
X-Gm-Message-State: AOJu0YyGYyDUDIG1z771WN749UtmB4NcxiRlQeTw4G4TAAqcbQYrLuD7
	KnXY7bQPnpmxYqNk5CsawIBgYtNy429GX3uJrCG/2zK12GgUd6uHGCX6Sskh09fNFBeHsX/3C2p
	PSdy/LzAFNYn4mEB9f/BsulyBGlx+bBUPOtykFCY+1Lbb8Tcp3SGInA9CWVdtxrUk
X-Gm-Gg: AeBDieulSh16nyWGHDEJhfuxtaxZxDa5ERJHdX6TXCFThOCM8PNkUThZRknRa2waknb
	oFkMK65kxFmJmUygfcB8bhl4j08LaYnD3vnwR0wVzomEky0OSpO0fEFSVwdpFvYUO+hmPCNquns
	ukoVcxGkR8ORuOtlfZupkWcrw/IFc19frsGMmYPMGwA+xkcRnuf2sPlb0/ZsI/L61caTdyK1LXU
	u/itLru8Baaok5LBFyIaD3Nzrwkom784AoOrVv5xt1fql0kz48vIYrRgOnIYk2M3aYI9MZproSp
	fBGlQiPuipzz9j20C6dP7c11iDcEH/VxWdD/pRbXnW9ikqEYXGUkqYk/Ycg2OQxOSp6CFgweZdQ
	ZfIVG3rrls4Psb3xIrXILGqlCpiGQMwQJ9m9R640p74eYjjljKbXtyiGhM4jv09+0q1GCXE5Egc
	7dC5uq07c/VGRJzCWXbJuDQMwMFSzznXJ0BXRSUhHv50/xdA==
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99847121cf.5.1778137700703;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99846661cf.5.1778137700205;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:09 +0300
Subject: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=712;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DpgMRbML8GFqypvwXYiYitpkAtVZv8+fXRXb
 Vd5Ftn04PeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1a/iCACMJACnilb3n03uyLi6TaAfrxpc/UBFCt7wVt23e+9UMHZ2+vsiS8SpgAMdRbEl0l3X6Ej
 +yLxQc4j+o1QSqHLuMBViP31wuIwjf0i7zUG+ZUWLQ51uQwC9JIrZ2RdH9dpPFooFnhcu+1wwXH
 Hnuy0o+sxe8FAwecQpF+Np4OBLQ+/fZMgXa7zxjvNqxUFq8ht8qkbNpPhfQzEBfOzGqQI5yDAoP
 CpOehfpO21GfxTnHBgg3e8qVyXq876Z/p0eKkfvWq+nrS4O2qFSvtEnk8KLYxbWWu/2lYoZhoZF
 BI3zeLED3xsdSQF2tkd7OfkJ9gaqW/6bWUTuPodn1PDMj+J6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc3a65 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KOvF56qbc03BBMn0VcwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: XGimRCwqGGo7hmYw5lscjWHLiOHYqBMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfXz/M46X0m4eJL
 X5pIt+FbaAjpPhHJmTnECJYjbVWWUu4aSEfC5qS+l1brjn2CqpKFsLcXvrUQoYSv5va5zMj5a/3
 4nk27tYvmhWJJkoN2CnZJuj97YYnkPce516OMahXuz9JLCFGHY3dFTsIGgHe2zzkwq8rIS7dFr1
 epd9vdCJZuMVHeEZe2Y/3AQER/j76qsBu6qkz5HBGn7ha8/3rjYb76kOjgY/4xB0BntVo6HawR/
 529G43ek6HB4FOvcPd+qlWFZ04xoZrqliQffLK/xXb1d9sb7WQEa0YbpwgSc8a7/yaVYMgwmLTR
 3bAFpmvplhdoI6hvCNgN9zAA75JoqG4WRrGZXCy4SUP0UwkarEdLVUNI/QxyuUZLecN7ToBtkhW
 iPbXFyKNaj5BGIF6dCWVth5gpuuzzs9Y/JG6jH1T9qCld7JnXFZmApob6MpPKh2zxP0oWiwHPL3
 2ZFfTgZp2bldMzS6lgA==
X-Proofpoint-GUID: XGimRCwqGGo7hmYw5lscjWHLiOHYqBMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6115.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 4c3804701e24..c5251aff9886 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.47.3

