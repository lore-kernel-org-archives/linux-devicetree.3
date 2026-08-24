Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232342B756
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572600; cv=none; b=Ove8f3S8bCElCw2BZgqDOXXPfklwl48PDYlZLfaTMj3JhyO0FBVtSlkpzSgMdh293tOkLIZAAKY5aJLp0qMyCO/igBYkqbxjTXte/gymyKi/ywJZunC/OP2W4P8/+twdJyOHNTszl1f15TIrnlFsNFjKPtMnGnVUEHWaopI+NG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572600; c=relaxed/simple;
	bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLU2f4QRW0z1APnYivMV6wXZAu+epKLhL8cCpf/f9mGpq9lP1aZKlfCIw9v1yAyfOjkhco8JQiVbJbPeGIofRBEI7S4MRnQs2GRtXU/30M1+y1Z80/EJKW899XdIBmGPW9zDHWUl9X10G5eTizyMMJ5IvVmOnhohcg+9AUvf+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtygWSqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROpcPHFj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtygWSqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROpcPHFj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeQg3195004
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=; b=LtygWSqr7KG6uFv2
	VQo1BuRH9mNyTU05QO05HhBz5MmVZOaFC1Xfc9vNY/+V5SNe0aOqpav0yKB2D5Be
	GLqiYmppyzfEZ1p97L+OZ8Twfa8Ykbmtc3nN69haVlZccFTjH52DgWJC7VUWHAb9
	iohbxKj8FLv3biY5g+54VbJffmPlv9fdaguxXgGUmno6eEtYLcTfwzcCXItNDN2T
	09kZpKEve6NjxRnQSqg7dLjBE9Fi/G9jSL9le0czNczmml+GQ7e/u3LCPZjucviZ
	qovXN3oryILCG/X9+pEjkiVY1PRkL2mm03kYS9IfzBHa0htsSGmSXBTVunx2flYF
	mCD9tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs32d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso356587985a.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572597; x=1788177397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=ROpcPHFja+GfYrfui8Ka8YxbeO2Z4gtdCclrYTMfUHeLj9f8azmRgfcw+7iMI3mOJe
         d77kVgcnrJTtTtA1bI39YQL51qBOfAoPpLKA37IJg2ON2r0xaIyEF860xmvKgL1kP5au
         69tG2UZ8aggubxyQITlksEydpX04ZDuZn3/1ZVGo9uw0UQ0iVeYAh0o9P+PU2L/e6yO9
         5cmrRt9FBLY2olNmasjIba75qNcFlIcq/Ij/scMuj7QJq1jXrVrDjrsZwkWX4apbiDyU
         mwq5Uvuv9MZ4ecEz4xfpAbrKYfzW+CV3uSXTlgOZFClbp7+k/CExkRkzJQJuOezCq03I
         6MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572597; x=1788177397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=DUbkHH6+3aHprGzQ90VH+rG4AUsUtMBix08LvUJTJbRnFRel9x+KHvvWhGy2lU0nzv
         0IZZXVxVyJdS2T13IPnLhg+dskdj6guVtebRBZKFW1nQlXmX0SHKDLN1AAdhN5H1vdms
         /TqUovgeja0Kn4xzzy0VO43p8rlSPwfw830ldU6fA6G+kNk8ealbWRI1Y68HiXJLOEGu
         fvJSaZrkM+OUs63DXRWJNnZ9pharwweRAzt9fpj/cL7C6dqXHRPRTqdtgPOCgFfaMAbL
         mvZfL9f37eL96OKfkovrEOT/AsCYLHGGFRw/Rsoi+VBJ9cHh4P+QfKrsh/iv+xLsxVx7
         RZnQ==
X-Forwarded-Encrypted: i=1; AHgh+RogZJEqIJJQgNjC+w+/oLq7zEdsOvTOcWde/DceQg5fXVWrXb6WeQYR+wH+l3Bh2uEJ1+UHexTIAwb+@vger.kernel.org
X-Gm-Message-State: AFuF++k3BdEuDIwwuylddYOL57P/Qf9oR19wewFMBG0bR8fel8Fwgo8z
	7JT4u1X6UZo1MNdm4yf+bjMd58EXWxzj/xvehetXUSZYkEGZA66wpL/z8Vx2QDvmxfbWtHI8Ntw
	xehhigU9deW/chWVynLUUe7XycaNNOVlUmFcZJH59pH2x8LFMrOzZXXTh+qNPJHWE
X-Gm-Gg: AR+sD11I0+SGJ8tTaq/lUCVOEWMMo5KXICSa4fCHsJZtPQDENbPLgQnDlOh9SHabUew
	LVshkPMJKdqFxlzOEJ3Y0bjLEN1Ust7reGo8n4CmCNTII5sfNELjFbSWZMfUc6MOtKNMRXtf7sT
	rxuM0rYbHje4CnNoL3WHC2fh4wuAh4OosnBmDKw1il/thj6VGhaJbokKdlwt5R1jaX+ZPOviRW8
	HUkC7SaVkQzZ+ypmkReeHNmYBKIJdc1I6GLOE07KHW1ecX3REkxrC3mN151SFBnPVlDZyaHjCBE
	C2gXA7ffh4f8SwkQFfbsL14iy5epWYr/F/26PIBRBRgGVFYCq9YX3gQadKdjNkMB1JR9sI3Is2y
	Gopc/QRTp
X-Received: by 2002:a05:620a:2612:b0:936:d833:6c48 with SMTP id af79cd13be357-93746948d99mr1816633085a.27.1787572597183;
        Mon, 24 Aug 2026 04:56:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2612:b0:936:d833:6c48 with SMTP id af79cd13be357-93746948d99mr1816627585a.27.1787572596603;
        Mon, 24 Aug 2026 04:56:36 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:26 +0300
Subject: [PATCH v3 39/47] arm64: dts: qcom: sm6350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-39-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD7KAXoMMhx6e1Yt4LONrmSCGlNmxXUF1DkC
 MqV4GWSNYyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+wAKCRAbX0TJAJUV
 Vi+VD/9yP5p+rlfmvkHcqOfs4f9hTVZPwZCnX4bsvTlf0s3PA80aEKqHA3Jw5tQ5sElo02yg9ms
 MPuwAQpOavzGdm+IwKBiDGRGbSBiZA3kB8peTmFqomDTgRGL8huU2duObXiXv72seFu07isnEEu
 JMB6xuksL3qjK1V90z/S6UtwiJ6dU3bCjumWOQDlqcA6FzY5XeLBWBCYVy88I0xNYVPa2CGqOCb
 SochkPFdLtXld2x3MmwS89i2URYzeW7bN8wwI61O3jEtiwbcu2wc9wbWA1pMPH6bg04BBlLaSO3
 HOBKFpiTxV/wsW7uPOVp4IvUBa9hezqGGTWPOEzZXbQPgHtXGXmrbtonrAkgow1yXsp2mJ3oqm8
 ERfNgTtzpUFNGWfJ4Qdg/B3TpTGoUrGZJejfn6X9am+FwFRo2swoh2aavY6Zs7lZN1GjcqpmMWg
 f+v9qgyg9Sc9bFlu4Njopl5ftJZ3GjY7lJXln4CITKKQehKyLvdgW3K7fDmRZFOKlf3SaCjtYpR
 ZlHwoyUXuUq2WdhEM9NY/+vkV//aZtVNmgVRunx5D0wxCDKGxx77etaIOlS4txrGyBOz5dDcToF
 9hWkGJvLjyM1gLsZhVS4fve9N59bDsXpXfjvROk4kp1X9Pw3JZ2SO9BPk4ncklc0fWheaZ6EFfr
 BfSulpz8gDZeIgg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX1ncffS0dPAx9
 8QrpQy0bSqTLbLwA6My+ccp6xAPMLM3eGlRsdcgES5yjZsundtIER6tofiJy//Gyx7WkB2diPhT
 rLKmERMee5IGZqffhwADtwky4CCd/Nk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX6rF6BUqrp7fU
 CuFYQM5svk/ckABzfjC0t2VONvb8P1nPaiNpyMjPmvC/vvGKuSaH77ad7uNLRLZP1QkahApkgjv
 8MPUSsNP5KSHOY3xbuYGyDqKDwGMwQt6zRcssjGxB38txN1qCEtYly0duYp+XkfbvHChMlHf8Dy
 IsGuE+D3r5aoYaz+UTsJ7WoceeQ7shsOd015HRuqn6jzt87D2kau+aG3/g55vVnRIFjIjbLjnG1
 f2azfSUzuD07wewOMiZDCEpaubbcpy70dwvZv6HxJaIigxXsDZoOUZzQ6mx1Gm5SOyjQwCiFZQ4
 y5JiHLli8zHW76hgoKqZbbM1/HbHTEm6xMnc3WGpkQbZp+if/7vqrG+WmHSb/w24KS0CVJgQt9b
 LxkVfOu3hIDEgloMTAOUrfPLBHq11mkeb/5fKaZn9m2Qx07nlnR8726jwgGpxacSx7xqSrUj7El
 eegxG146zVZrlt7i5Fw==
X-Proofpoint-ORIG-GUID: z3TY16cGQt22yeUrL0YhDFnKBKh6MIBg
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3175 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Z-KR3oKqXnE-yqQhW-kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: z3TY16cGQt22yeUrL0YhDFnKBKh6MIBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GCC GDSCs on SM6350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 15d38b7e803c..ded5c3a45891 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SM6350_CX>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "sleep_clk";

-- 
2.54.0

