Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56EB413794
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572566; cv=none; b=dNvv7FpPhrs/1yKRFapGgOP8bSgLawvZUCiAYZn+D95TDjpjTat2YzyWZ+NdX7eWkW9/9Ll+inJJMQuABEpKxnq3S4nr4mNcPObkNHs2IpBOoTRf/t+nVX+StsszCSd5J2GHB4PqXbr8ppeMojgfv3IG1Rj0nOMHYwl42rPI0k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572566; c=relaxed/simple;
	bh=H4nCEKVhON9X/Brrj4o6yJaAsoG8nEaNyd51i5pDN0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cf/uZbsfn19uFUBrGyqspVjleGcTou+2ZOJWoErWy2cfN5ZreEHx6kEQQY2b2ayu/zVf7za1FLBWxVDrBl2a5zqFqTbevTNcwojTo1O8FQer+AyBqjVkRv13f5v2PfYZs/mfhody5iu8dD0PqFU2kL+1WiHdwUeh9OPGKxcVTys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LoxJ0FKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJ94ZGCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LoxJ0FKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJ94ZGCs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMnXR2865081
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FJbPyZeT7J7ceuGEk6WMnmb10ok6z6Uhq3/5RPhOSc=; b=LoxJ0FKN/NQUAc0O
	YoZktFy0dsEvM16IEYhkejLDOBncz/9vqsLR+icvWDD04QJjvlHJmPM112kNw4aE
	vbWRbEmJ2KvgVMtURXhLI5qwosSt4WlfMZ2AahaGCsDVCen1OrzflAL8phgLnuBX
	/Qs1biWANMisRXPJrQrJ4KpR2a6rq0aO1IyJwgpvXLUvUTipodrUCMDz+WZhC8O1
	ijHjrOI2tJ6GFciIPI20oZSa1cNWY4F+upOUQlDu70PKdj1KNtitW1p4cZku5uJY
	1bo2lPkc4ugUx70ll9gP/Dt5fHEWWN8e4EK/csM+G8KJZK4czMRNIFinE7JPRNyC
	0FEZuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so35559651cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572563; x=1788177363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FJbPyZeT7J7ceuGEk6WMnmb10ok6z6Uhq3/5RPhOSc=;
        b=dJ94ZGCsvpBbhvZdf6xhAx3Lbi+9j3RmENj4WDHGc1Y9mT6yXVOlRcuT+mPyJ+lLAt
         Tx3t4WpAJuUznjCULIwj+VBcwXfzlBjjzKS477wP/pCD/Opd3WHHBumblWWzIW76ThIG
         uncBMV9bcZHptrQlz24dhx4UTb69ZO1GjiaOocUhqaWmqaZUoprkGQ6Rr5CiRkj+1wWp
         X86jEiC1Vv/zsPtkNsGnhCcDtlweDR8rKDt1N/Wy98r7UeA8RDw0AeZJjEmsfaU7tCIP
         s7mtEtVHioZ6LfxX/LqR5G3sSMNCzgZ+Tf16C5Kv0IZ0V3hz7yY/u+1hnCFqe1AoDYLj
         KY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572563; x=1788177363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FJbPyZeT7J7ceuGEk6WMnmb10ok6z6Uhq3/5RPhOSc=;
        b=L0lzsVmwutmy9PkJFw1NGi0Um3UDHvJcPqwlHYPcy3cFFswwV1hXj62ZLeo4qOi12b
         rlz7R/NZHTUI4Arw+EDunX37+BSqIrPZK3bj9MAqKd6H3fanbJMSQXroxx0IWJGu4DcE
         oBJEy1qgnz4vpLOdqa1xdCLPalxMPQ6/6PxzfRI/0IbJFeQiQN9doFCFNfFOVppfwax6
         rbK262sny76C1TGCZJDmeB262n+2SkPjoBpVSciTtS+jGmZdNCfyHsMCx+M9sx6C4H0D
         vijn7EgdsLhNi+cWWjM4mZ5TkNrV9Y8FVIMVdOCFqKgGR86q57ZnN6npb+/US4Fg+kts
         AibA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0+hUeWA4jprrqpCSbm76l5KV9qKaDdp+InCt7N9adc3TAmXX2lKIaiqAwJTVF+eL9ZpipwO3ThB2f@vger.kernel.org
X-Gm-Message-State: AFuF++ktSjoDVaA0/lyJyGNeI87OztCpg399rJvpe5AyRzdUlCWeRfak
	jCbwkw4kye3lRrPq6Q92m45S9v47f0V3bo/nBQQLn4AqF+rmwJRbzEoGISHzxUITayLR9nQ/XfA
	qsLxBSeF1jGD0uU4BzcWee62wnsVyVjkgm393DZbcchQYyHir7ysDPGWGvQ0iVova
X-Gm-Gg: AR+sD12IhQbgbkgnpO9WPQOKNaJkDvOnjL4Yt5KCbP3rXvMKZfVKWZQtCpVv1xZ6K5J
	cRRYmdioNupTGc981d8jw8rgsADIpjSuUcQRBDO5lkyI8ogmK7Xpy6yyZUzAl92PaRLDwcJlJHL
	a1khgLioTcWfKbWX/qxROBXFlHjxOLEc38Hg6R98EIM4QDsZ/oNxMjZ4v8PJz5XonjWfkR67Om6
	wkFvKUGA0j5bYIxWDqOpTObtvU3+FdRbDDrGRMVCKMzOckpEadcGchboPrsjWpF0lmGYu5KRxgj
	gJWki1Zv6O3sBIsXgRA7Myr9+tqgbzH3Zdl3arHEWYFTWAYMKCwpxvSKRzpYj9HrVjGYUPPn29F
	a1CcXeZnW
X-Received: by 2002:a05:622a:1b14:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52df56e4616mr279956591cf.6.1787572563067;
        Mon, 24 Aug 2026 04:56:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1b14:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52df56e4616mr279956191cf.6.1787572562619;
        Mon, 24 Aug 2026 04:56:02 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:13 +0300
Subject: [PATCH v3 26/47] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-26-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=H4nCEKVhON9X/Brrj4o6yJaAsoG8nEaNyd51i5pDN0g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDumG9oTGDsimpIrCtw2oynwKyyY7ZhWii+5
 fSRsUvM6rCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww7gAKCRAbX0TJAJUV
 VsnNEACrpdjUWu7/JpIWX3gJKfJftf+d1H8XqYjQqedlxNDDPizmOJd3DV/J+EeCCHEQkEatBHD
 p5j59hhtGCB4Y7JFKf/l1CMwhON2D5mugngqk1x/FqmhyxZ+xiWn2nFa6Vp29Vyf9+mz3QXrQgi
 1Oe+sNxDdEt1O5JsqdPYu+fnYRnUkrfmIfYVuLCVEDmEgoWq5XE+T/RdfgZfonYYTzXKKNbB8qp
 CtqpcrIVfC0lW6yaeraNrT9SrqaeU5sYrmN4hnLSUbkcGhY/hUV5BDQlF06z7QNssiZlIZS0TrT
 ltO8TRdZE2TFveWiQEBfRzP4QkSFUYmmJG2hXbNL8Iwz11yhjSboQA9c/XCK2PPFCXVeUHtuu4N
 dliSUtYT2crEkUdz9SowosopDPWB8sDuYIaxASgnfWsPOqK8oHAehmkJggf1QIfdPMS7l4uBHyd
 QODjXsZzW18TpZbXoWiGt3NBUYJRsIUUBPhOGdk5dUmpTtG3x4vqL3mqBFHwSCvj6PghIdOSr7F
 o/jS72eEBqnbwonL8zVnBUbL8DSalr+CFqAbLwgNB0RUBjM6ew6wUUz9gU9I3BLEFsS4Zusmam+
 dGjzh9Xz3JzjqfZQ/BB31xbIYN5mgAxOBYBbcmsIqagyy4OFUHWCPzPM20LIqzdsz0GemBtBQI2
 cBCved26KkUgB9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0WZ5WX8y6NG/
 YrYUt2DTKbKsNKJcDZDcC935ei9Qfov/EuRMA3xsQiF4OyYWzEl64hfrx25faGFCMvZzYKhiTDm
 tk3jLTehKKYZUKFB6XLdlfPAh2Ooe3RRud2oTmc3hrDWalplXdkcc8HabOL0GHQNVQvvvj7oP2B
 n2/3Qqzv4o2chkPBcQ2uxzB8uGii3xFgzf5ZBXAyP87+rS9s3xLgCfGBLO70jTmh8VtRls+5XYK
 XVtQBTvgyoaVfLirjLdoFco59fvlxY7SaF6ykkuITsHKHbOu8bxKu4tFhWa28QcL/y6oT50xXY1
 q/7Z88EOivr50nazwS9BeFSgbr4nH6YrCQe70ZeW8ZLSDEjVUunWaeo0DMdN1obAbOHU849wFEB
 cu3mRjNA4aLNFk92zkYHjxsa/DlQHla1vLiS8rQgjizGX9FgXplN1cEXGHm3H7xAivlUAGJ4WOi
 9ahEbj48tIVKE1y50ag==
X-Proofpoint-GUID: n4_BqOn4AgFYhr-V1P8aKDokbuUkzKPQ
X-Proofpoint-ORIG-GUID: n4_BqOn4AgFYhr-V1P8aKDokbuUkzKPQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX5p0OmAPG+SSc
 6jlrLEAHolA+3OnKF+RfOTyvfi2POBaw+o1gPcd7wPGGSccSWQpeYsebcIuG4tz+62t40UQaBCP
 hHkXi5mIC8QRU9h7FRwBhniym192jgM=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3153 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..996ee8592fab 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3786,6 +3786,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.resets = gcc_sm8350_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
 };
 

-- 
2.54.0

