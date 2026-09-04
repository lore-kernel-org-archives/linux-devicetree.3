Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D3948C8BB
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524516; cv=none; b=p3MkX7WSoSEq/G0AUSW4PUrgSZphb+336ZJ92xZYdadCdn2+Kx9CREAC3qoxlvZ4PwOH8cVPTVJVOSgYD/Bm9alPBaHZhxQMjnruVHkzDuUKqRrzi1fJxNxyzYB5D7AvyQz8ayzCweKoA9BpVe4vY03cMxps001GpI4bt0TJoSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524516; c=relaxed/simple;
	bh=8wa/wSnNATr/8K4vGBf2S5lyn2SdVEy4xhQJLUykVPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEA2W5cUZ6NsN1qiR2YMxvmUu+hMx2Jj4rBa9XPED2QriZJnXW+lvRQxgo57eUC2Us3R6vgriLAw4gRYvsqqe9IFJ4rToKAh/wK7fWltC1INlXGlg1ooRegzpduYdeL5juGuo+erciu0c8ovKQxGAb8fI+ysiXVvI+fbVDAOgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AED/bXIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXFg3Z3/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AED/bXIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXFg3Z3/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIAEw2094864
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 12:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC0mExSjA7uuYAyulwUXl6wDgugRq+25QGgak22CRV8=; b=AED/bXISAHQvMqLK
	ZaLhDWeC/u+VsxxjOAUHFBWaDG7gAL9BHviS0KOR6dFKUsPoOsbDbSgZSVq7RVGz
	MbgKwHLjnOO4sLN/WxJf+drnPiMynzcGXCW0zRb810H9bHiNp0piJWBaGA2zRjjb
	G07XepPacdtrz419H2/CAUXZxZr1ccrHjxafLrAv67kaophDukkzzHC7SEFDGaIv
	25t5ETIs/K0k3X2QSktZWtPGD3EOWyYw7KKJTMUjiS1nLCo27/DB3WPbMXuyR3fH
	5liKUDCFZeh8MhJGfq3fZL16zg9+rvQRdzq+byfvC3zfX3/ez4/tk+gJA8xnteVL
	hfHrvA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqsgpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:21:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7890eceso194917137.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524513; x=1789129313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC0mExSjA7uuYAyulwUXl6wDgugRq+25QGgak22CRV8=;
        b=RXFg3Z3/mhLTszXUwhjtalUeRIrjjhEQ+I6Go1bkGsIVZBStfzWQox7azpGzlemATL
         e+xsOUwUU1t9rPeERQh6/z1qlSsHsMK5WFipBXREfsC5Taq/F8FRt0B7WcBk3uGmo2uv
         yl3Phq5PypyigpWmNtak3P2ICAu6fqAHBCsw8SldUVa5pCQp9IBdcbzixNdQ0uty1TL5
         YgUtG56736tDzkyrZdRs3gO8+39sIzLlmblsFkS2hqCRv2PMOB72hgti8tZRbZcMZtAQ
         GAFtEGBTBaf2s5h2bPj9StFVEGlS0uLjY2JroBppxruvguuWTy8l6RWaMZeu+DGLPo1U
         vzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524513; x=1789129313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC0mExSjA7uuYAyulwUXl6wDgugRq+25QGgak22CRV8=;
        b=nTffp8YVSOJ8kS+pOCYkBFttZwYqQBqT4hEdrmv2V33aLcQSIDlD0ZYhPHnUeY8JYE
         +FM0ocHzyFsbGIYkeYa9jSl9wq9OBMJg77Snigu/2VLqQnGhzA761ByB0L3+NleFgWIl
         86CEZ7wuu1gH8WWF7CNCq47/RaYW1WHdb3qmcLYgrxMRDWsjL81tHqx25uKaEc3RjGKA
         AQb9lLanVoHSc1RjHwB1SOJQHbP65Wmz291IKy3LbiJzPNH8u0yBjeE/lUcSMM54Moab
         oLvHb/B5tlzJazRbgAXh+RY+hKkeWmKdMW0COheJbyFk4IcA4ohtGUYhfZ3xtyezZ2z6
         6pDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcerOisAfJd/tSyntq+4zLJNVgXfM6IJxBP8bSHwAUQ2kpIFK02I8btgVJ04At2TpT84jsCb5zrgVr@vger.kernel.org
X-Gm-Message-State: AFuF++k1qBFtZSvsipq1m2Nc+HdGXKUf8HTT4Ms8/xdbpFnG4NIQ3ip1
	yUC0/5vWHxohQkAEhtQA3+SNBLF1VmocE3+zHuIRePkMj20SZmjHWlGhHq0E18FpxYhkr7JoP2y
	bIyJDXoHRlD0Iob5u3KZUPVMRbGPyEK6AvVSFq9s8fDg2Zzc/VSsRX4ZOI4GzNVl5
X-Gm-Gg: AYBFou32XUJAAi/5Ki9NnYxGwkXUTJ8n/Pj/Tv4Cra/IS37JEWCTaL7huKEB0kAcMpD
	v6u0NKmaFDV8XFl97aCZ/Lcrw6ZyCr0dcuYmb16gW8h3Gx1a1yL52dSTTZysB4R2yrzGjpDsLhg
	MB5b9pknM/2DgKSs86TuNJalinutKkfkvK9uMu5Gra0s8UgCoF7jV/rvwXhrW8fO83b9bc+mUMu
	mE8FZCcY4TlzBRe7VKheYLEK8Qscj9Iqxzx+3mGfbJIiDdezG82CrrsZ0qcdMYwvmuneXDxenod
	DoRI65bFFp55VwSxzdw1Eyt5HRtKejlBKwYvh5PDcG+gZ5j/z4yxmshScLDVvBkfjTcIWxV5C1e
	Hv4GsbA==
X-Received: by 2002:a05:6102:1483:b0:77b:2881:580b with SMTP id ada2fe7eead31-78a4a949f58mr1669268137.4.1788524512997;
        Fri, 04 Sep 2026 05:21:52 -0700 (PDT)
X-Received: by 2002:a05:6102:1483:b0:77b:2881:580b with SMTP id ada2fe7eead31-78a4a949f58mr1669248137.4.1788524512483;
        Fri, 04 Sep 2026 05:21:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 15:21:41 +0300
Subject: [PATCH v6 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-2-d4f38936902e@oss.qualcomm.com>
References: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
In-Reply-To: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8wa/wSnNATr/8K4vGBf2S5lyn2SdVEy4xhQJLUykVPs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfYBz624aa1IQ/hsPcpt1AhqVQtyPxIcH55+
 mMvM17AT7iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq32AAKCRAbX0TJAJUV
 VgR9D/9u3zASCVeGdo8xm50SaWFhTCDpcj8OiKs/59OAp2CQSqvuiMcDjb32pErzckxHV7v9w3v
 de3gMwhP5TT8IlTytNO7S2zVoG1ALZKT3bxe548k8kqqcFqxarcO8Wc3cotNpgHIhyMyT3urXwY
 5VNzMKQ9BS9gXsr0W06fcGHXbdm6d3s9xH7FVDE+Rqy8Pa+vpmZZIE32ykH0r9AAU1v3mZaDsOE
 y3OHpYX2NxuiOVEk4ME0l8RaHXuWqfGL6cC9lTHzHXM7wrhdgXd/M/WEJencqk8D6DXkhjORxTE
 BDngwucyjkLA0ug8zxfZL5xqe1NQseZ/bGhUiBWkz9ukUG4AWwY+JsfJpW+S0dFYJSeDivBLNLI
 v2DL1Duu1mKW/q2fZW6qfdmsqdHRjzHdl5PHUbkzhk75tJhtxPfwyP4mDbFdtwKkXjlKyRNNUhC
 P4gOXUHdZSpuxAsx0dry9fZ8hhokIpI4zbge7fQ874r4QhfIgcFCGQU3CF1gVCokmnkySPw4Kwu
 OjUDcHM82an3F7wRC5qfbRNNcwdXUwBCJ6KjFJXKjbvdnioeBLlkp9K06YzhoJN4XzLsNiKHA+O
 MHA3FU97g7w5HIx/pU7NNnpxCs/m+dvdP52QFtpY/75o4x4zGkI7Iv7SJpO+4TE1ADIpGGaSIBY
 WG8cr511y/hPi3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX5t1JODvtzbh5
 cZxv9OCRL8C+lbghiJAgp6kyQmMR9YLrZVamk9Tyidr0ND+XaTaI+/xx1H2VoRBqrmzINBaX/I5
 PfOhXuJIGDmDXwyP2rhBSct21kIHlRQ=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9ab7e2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9m58Uli5dF-u6rxZbY8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX3PyZUkjZ4REh
 VzArrt8QxdHM17DU6oY5P64CUcPkMgpPtwE1S/vYtq8CVCJtzNNZbadw2i5XAeQc48sHKG/qgIk
 jdPCKNs2vyHxAzbvyoH74WRVjPXATyW0SYdUUkiMT40YDfzTWkbHXFAqZE2ACYfWl29KJyo2Lw2
 Qr8nq7e4jUn1uXVBwld40BdPLLWsZclr9X2Wx/kp50j2LF8p8cOMAMfbf7Uc3v9I2bfQi0ef/S4
 3Dnk3fMvJDODhMIVzGxRcB9LDfZWpvw77s4yxecpL2BSLAyA56t7plkDZMm74/nBrfwOI201cau
 Ozl1TwgNsLdmPeTMwPRWx7t/JO1jU/8Nvz4i7byvg1DELugOwe8wzpNVgrViGmDbJPxsj7E0IQQ
 v7hvqXFVkm9tqchsXwQLBfnKk1e3As9gcqAgE0zXIayNnotK/cmNAK1GVn4scPCx7bMSKbdElkS
 +2+CQ520+8UYj4gFuBA==
X-Proofpoint-ORIG-GUID: lQUNYFJMB0d3JE8n7RigSEomqIy4wOQZ
X-Proofpoint-GUID: lQUNYFJMB0d3JE8n7RigSEomqIy4wOQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040111

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 9ce41ba4da55..d22854856cd9 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -492,6 +492,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0

