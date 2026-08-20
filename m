Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CEA40EBB0
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220567; cv=none; b=FnFdq7ps5rR9+pG+cFNAXn5mBTdWXds3x8cI0Qqd3rkTUcsVKJfBhx0TdgB3zg2kZUvtuhpmxVC1pUmnPzyJjkXRerokYADTQWBkqUYy34zZmAva+UigCZ+FXVzx/kv0dXidDWVh/oM8eujeaGltYL0r//Pui8hySHaFiWyfHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220567; c=relaxed/simple;
	bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8/fKJpNP14hPKrWCnUeUyL9KhQXQG1yyPishfoNw/nnnwAZ8yNdQU/S7aRBScClkF9x3aZKekpWEFi/aD2F3UySDJhook4mZw+9/9QckNs2dqY8u+IV9DordqTYvnu9uKU9V/aH5a0o8WNaCimbEz7X066bdNkecpHRCR9lMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgU18Si4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgAgjyOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgU18Si4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgAgjyOo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6EPje491129
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=; b=cgU18Si44FbuXRnF
	wX/takugC/H5vpLcGEAvhvwIK0hP0IR+NNiyAP+hmEySANRfs/Xsm2hIkcwNe5R5
	is4egN+6ZujsCwLeqReWN77hJNrDG3eFeS3Bhh8I1m2cbEt84+SEWWyA3me+tr1Y
	fTAa5EXhtFXYtemMMNWPaiDLaYrTWHOJlxzBAazYhh6Z26BF27XOK4890Eihtfb/
	/iNrBUsHoPCiBVHBzqR1XkY3iKLzjcWyvcER2PcVYO09Astk2ZgtwnVKYPiE9ad6
	W5IW2cdmtp11oLNVUtdwJGjQU9v5YMiq5gYf1tJbcjS/TyEYcJOAAhxP9nfTYo7b
	bBn26w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervmd1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so232926985a.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220549; x=1787825349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=XgAgjyOodSlczgC0kJVRpNqqQa4U79JnHoa8/tChI6OnzFN+tpZYJF4J9IsGzurIp7
         Epv0H8HnSQGt9e62IVJMEnN0aj61XSQ7+OrICb7agisZDZKAMKjRgVfSrP/4kyDWpxGb
         AQPAwml44YlTgR/rDOow60QSQzGgxX/UsEPs1mcfksxxEsAkHESNAhGe7sP5WG5zubvw
         n6Ek34BZWEbEhgcU24cEAHEHLD/VSTOUZBK+61lPPjz5ssIl/w3GwVu5bWLTFPg7WObG
         TDJK7QnQFVBzxj1faXfZLbXG5K2wkCP10i6gMdQf3s1q5c3OxZHqVfAo+guw8/K+07+r
         CtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220549; x=1787825349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=GfN3rlrfgste1W4zkvDiidkSpJkK9McOyRRxAYN8RVLG5fUEhVBXgDUjCPKZn5vHxy
         3upSaTIJT0PG5ZyVTbST0w/VyMy+AbVHn2y4rQzJ+Sn3ej3kQVQZNmip+UA9rebDa+J+
         er84rwyIIMIuoPHbXt0G1fSP3DUJPnmNo7ZRMPz/IgkLABb64ltlHVNfsUxJXd4/WCKj
         w463atIkCAPmGjf62Wr64PglH3/NvHlJ2o1Yu76zrGoojT+QMkfjoHc9+qudUJ2KRti5
         hdgcIdg+Vf9yaIUYhnERGkuXcqvfIxNEHOWTdj/CZnTKX6Wk/C0vtGtJWPOYOjgsSNdF
         e94Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVI0UNHGiloOpAVnZe0OpCROdQD/ltqmEDaQvTwjXNEyZCGVxTfNpHR3vBsa3crY1o/lcq77ngVz5g@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXT58keVqwYke9/JLdwcqlyYS9qUN1ZZSLqnUC3sC0s3z8ov4
	l/vOlSO54035Qgun3+LFT8dtmdFKfV6MdYhj868J8xLUYslPJdb1735RW2Z4zPRoyhQNIFt3HyY
	0e0T8knErt5minY9vLVK33+1KFokaaf7xNIuR9I3cZWlEZqJNCQa/eg+5INLZ6Vs8
X-Gm-Gg: AR+sD11XPFMjxEe/VUeI+L5oZ9dsxPnTjFavU4mmslopzBHUmAVl7ftiYC4HijqgByo
	jvJruZ1c5hn5J+KQNb61vqOmyJiPM335sOnidAp6ezKb2cnyL9TW4FkMSbT4+2LscOc0Fil2R5D
	8aHdnrDAysEmzq0VXVq7CpJSZAPROcEzS036WEtm++tat0VEVAGL6KaJcCrQO/MC9iWz6qpz7Qr
	OEGKM8HrMZMA/s/flwvq4v/q+rdoDQOBPOCNOqIn17h7VT1y0n4qBMARsv2dsWrzmRtUOqnSxPg
	9dqJ9+63UWf+g1SfxSvieE1i1zoTJlesDxnkiPcdeVzurpPanjbMey/MZhwdxce6UsOrJY27Yah
	vL3yR4IF2
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr1114432085a.15.1787220549041;
        Thu, 20 Aug 2026 03:09:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6983:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-9371e2585a5mr1114425085a.15.1787220548547;
        Thu, 20 Aug 2026 03:09:08 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:14 +0300
Subject: [PATCH v2 11/16] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-11-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIHg6P9On6BUXfl9IwgIFYp7jcFQTA7oyWha
 t3L5Suo0seJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSBwAKCRAbX0TJAJUV
 VnQSEACBkuNGeHqM4plxObBg6va0XSoChtKET7mp3KWHIih8vlts21qAbPkcvSz62MfK7BiMPKx
 JsqoqpCByQjFC7Y1HyiT6iVqlfAzfixKNYH6jNFQWAFO/4gso3uE1nyp4ExOZNSKAGp3i36gTsW
 fqWgcpQz4Ter40sVKMA+vklfvwNbzup8nH8DuO0YkDGh8QtdVjK/dOctFHToo7OLe4vjHTby8KC
 ga6ZHp+6Hfwm1be4PUJJnycTRoVlopEN6uNfwaxfuJGLXIT9t47JliQYPpI+UTij2eeCy0mP7Jp
 2R89KiWvLvcr5a3uzb33zWB4r0ic0VHZIA3on9kEcmXEXkWlt1NjWa7ahi1vK1FcWNL8HUoSTQY
 t9v6xYRI/5R2Q/oZatKeoXaaGusv1p2m34Qv+F9Q0fegMbXsEKKn/kex59dBwcgNB1qck6nncFR
 o+k30ZT6otEyhfBn9ZkYx5pQnUPwpW9pbPcufZ93Co0OVmGvsbMhFRwWIgyxYsLENyLlPS1Lu0I
 eS19YzOGzOXGBq6EgZTRnoSYGAlzcb1lO0W5FVHFzQuUIIX7e3Zc/6Ow9MBLHguHrp6Ua00MErr
 0a0H8fNcwXcpbPq3BFhpqtLlhaDuobCoLMIPCP/WjCwLwSO0hEwWxUf2daOuMr1z/i2wp9rXYT2
 TVVpUug24ZTkUhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: VtUrae-2CbqXOXABKcehia6WDWFItk_L
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86d246 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXy3bMSpd322Fw
 4GcR023kGtkstbH/jtPEc+15R6o1nSw0l1sUuAtz2uG9xwB1dY7aSkzRr/lQlarCsKFIYa8xwGv
 b/UvAvp7dCbaedQw1Lm5XA7XsXM/2HckSIahkxc5KZH4DqGEWB8X7SZk0CgQwtQ6cGwRHxqDG+q
 LZ3Tnc4HUj55IwhChHyyNp8rfnu/oI2AnbWYxfjuojUGFBiGF5T10qrCt+w73vLCj1b4w2Rq3dJ
 VBfazY6T8nnbrfrmi3j9RMj8fvK7em95JEuwOqRkUJydJGR6Kl0IiocpVtWuRSjDZvenN7C/WF6
 bCPGwJZ8PTya8IYn5CisbqDAdTK9JlC7oyXLyG2+B9f0PsxYFPavpPWdyPLAsOPzDWxgUpelZQn
 v6KPEVC4hA6+jReK9WCRB2tzY7V/HzbwE50IgzxxEg06so98av6kdprb1/BdsaGSu0ufITxPvpJ
 /rx9d88qJ8Q3T3P+VEg==
X-Proofpoint-ORIG-GUID: VtUrae-2CbqXOXABKcehia6WDWFItk_L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX2c1ZmhCc3sM6
 2QntxzDu+rL4JhubDqT9gkoaWKELgGGNyVxruuGfgMEK28htX0O0LYSDtv/r67G9w7FG+DBSo1u
 bjtKcaperaRt4q5JZqwEbJvLAv83+0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..176cced72245 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -942,6 +942,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

