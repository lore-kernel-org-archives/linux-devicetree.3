Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C93DAAB1
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748509; cv=none; b=NHUw2y/9QESnsdWwolOAjaxEjqtuTbircrhubqf9rjgeirn3OndV4g1lIsHYNuk16A6dcVEfRSMHr2BnS1shpJ2gM/UxFRRab9/iyntWYha/no1r5zSPXT8+oOWuCNkspM8/OndGFk1B5w2+LAHzft9GZS/lSQC8YoikLqjarCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748509; c=relaxed/simple;
	bh=YVBftsMxqEyBM3msR4cnslQWqNvs9CAJn4EL2Iw11Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0mEsfv4ZqUKl84GBWzU8yT2P5w9d/Pd6f1BRdyZ9cv7UhEswd/oUIisjpjLMNf70FWr7wlLW3p1ofmtbD3fdvzxyG1XpUbVlS5mZnmXcH0kFNcZNpFRiqF1tIrm4Kuirwmf0xea/43WAgxPjGhy4To39//0cXxGkjSpqqLZrVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6s+po2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5qs/pgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6s+po2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5qs/pgX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736kpDL4123734
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qhQ5X4XsQLF
	KGbaA430bYByFdkn1wqwhTXB5LdY079A=; b=H6s+po2p2lbX/FAsj9XCPvZT7Gx
	+jneZlN0ByF1DlHkBKjE7gQM5oeXZURh2XVUghRKAZ3642OxCojuVkuMidplt/Az
	GaQVM8DVL4nNNMdl6sm+1NjkTcuB1YrEf3QqzTnnuzuhRo8zMA8a+psBxr4vyBCe
	E3rf4fScsIEY5IdUVhCe1MYfs2ngzIMzv51FpHuAMQjMT3H11ysaQLk4V682quv6
	SGEMJ416u/jA8EqGtrsfmZ9WuJDrX3G1e8rGecckzg6Ot/NVGfKFBqyTPGOMQNtz
	d8KZFSfoL/IebPWY34OimutB79UZ3qrut8DCUEAYSlvzJHDMu6ocovZxd/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp168nkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:15:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca860baea9fso8254820a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748507; x=1786353307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhQ5X4XsQLFKGbaA430bYByFdkn1wqwhTXB5LdY079A=;
        b=X5qs/pgXqas2+RDDfUwJ7bRnc9FUHWKVwzssq6iZXjnrHWQsjITc1jY4N5dbtGIodZ
         yskJUBqT7mAbzelDq6iCR51J3QsYPGrbz3CPm8jZCY1gGvJqbJHaXK3LhKHtfAakuny5
         vyjiM/znTlfXVgzMCV8kslY2Imsqc7ZdWJeELSK9ArqzIUd96swlXs5CZyCw688Cexkb
         Mu6+yd0VJkOAJzFnU8XCKPkTvt4v8+a15zUjyaXB+2AZ1uFFJLgp47SflRWgZ78tmY16
         vrQQDfj9CX5AzvS3Bp0aRa2FYtf1ZaYZZHi2Ku3TDzuVEimKtNQp4GPL7EYd9RXkXg93
         Y7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748507; x=1786353307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhQ5X4XsQLFKGbaA430bYByFdkn1wqwhTXB5LdY079A=;
        b=ng6tKbDXKFb9mfiDQ5V9L80pjA0zC9UWShmVdiy4rDs/m1T6YCyk+lZrOgnT3iBROr
         bI72FMYM6zdtMENyjJbBsXKUsSFGbWctx8YSZx0N23l/SBEmerMGFHPIrxnY+DcW8EhT
         LabhDCqRSnZAG80xLVkFgoZGCu6l3OksXXgOCo1MStgNqZU66yWgH1OVScbe+kHj5/Sx
         7WV8BoKjsCZ5eBbHd4HvmwElhCZQG3hHTkk6KQP+eWvNnrRXeTmGgmgnV0QINxUhca8F
         j+3q+99FaykI8xgTJ1B7/Gotidv+Sf733DTMHG3t8LOBSaBybfir6lJx672+9h2xI4dw
         sotQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjZhNhN2izEKy9qtOag0MxxlhP84pUkItvSDJef9kqUbFkwyZuFHMrx/QHDPz4EIRzwV+MkNseEHSb@vger.kernel.org
X-Gm-Message-State: AOJu0YyHhcFFQOEELYSeyQPgYILlxZ6OovtaaZe9U6YWGhG9GV6wb98D
	+BfaKSHzd5/oWx4f48ze5m+g81hFzXBKbobASyqL6eMLHbefW8KxwrKf1Bs2aays/SlLf6mQ4m3
	znOe2HrvcvwvhzAe4jR65OmV/ov73aoERsgaLITRmaOoXioghONjX8TjZhjVbykgL
X-Gm-Gg: AR+sD11ezIgtRKXMvpq20pf5ZsuxaBDlsezqb74lTuITnzDtuxHLf1TyUfN5XfxGa4e
	5h3LCIBLh6a1/MeoDhBEzkufflBzdaYXzMoTvP4Op0g+43Y6NNZNwiCLp2OHt8Gaf3Rz8q3pH5E
	NwFvpCK28KwY2cOVO9VdO9yAgjzuwvbKO4Vz/tD7IdfAr72DBHaphcR8Q4dKorZEHXyqykVxq0c
	AFXe23ohRM+4G9qvtKyYSWRjVERt+PCg9v+FrqeZG5nRsMJAOv44BEFv1u35Esc/YVG9uibvpii
	J3qF3BYcRraOzWI+B8VIa56Du6K5lk9xrWnQB4szCUuemEHt8jR85qgz9va1pa713Rl2Pf1/Nvr
	iWAn6l43xpIfo/c4aRzQ6b3nnpnY=
X-Received: by 2002:a05:6a00:4c0d:b0:848:76af:db34 with SMTP id d2e1a72fcca58-84ee49b4d9emr8730029b3a.76.1785748506773;
        Mon, 03 Aug 2026 02:15:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0d:b0:848:76af:db34 with SMTP id d2e1a72fcca58-84ee49b4d9emr8729992b3a.76.1785748506175;
        Mon, 03 Aug 2026 02:15:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:15:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Mon,  3 Aug 2026 14:44:40 +0530
Message-ID: <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX1YFEaUkPeC0k
 4lMgBo4bu2joeQmOUZaX7I8XWJwWjFQma0lSlDXS0tlSXuhrxDBvl4JdySrytIZWey7ga+UQhre
 xc/PlDCC1+rkcgEb+L0yQULmWRC0PZjS61fK+x5PCIhvgLTakEyG6Yakss9Rssbr6yLTovDDVE6
 g2abuXAjfVBaNaUTunQJqwZckU6GSBRc4RUbNrmTBiarbfmC/1B57Tbt7emgZjbcqIAUQVM3acr
 9DQ6OF0r/lxNsPCNEg5QKcjKvRjyVlr7o70pLXrKDHsJ3AKrntkctYDbjAALdMadYNza8DeMrv8
 ROaw9e+gmb4lJEyGqrGyu/xQIoI5Z0BQ/Aq82xiqHi1+Huv7qrS6/WvGiczgiihHp51bCPW9HkU
 gkO6grI68EiHzeH9yZwq65wRtJJsKeCeZOedOxP1TfUna+PJCdegUM8hsqMngRmypcv9nt4aDzT
 hYaVbDH9QNuEdaeXkYQ==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a705c1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=xJ7_bQKFY2SeBR32x94A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX1ER8gJN+w84q
 1VZCsmEF9mFkl7Qj7FnRjU1vD9uH2WFPVZpfUVagwU3OZSaQVp/hLDvfQgXPVoRw5TvPeqWIhrr
 sk7XcXqtvP3H6c0WjBy0q91MZmRVn8Y=
X-Proofpoint-ORIG-GUID: 2W-mgEELtrDnq8-K4UYF0OL943moyHVE
X-Proofpoint-GUID: 2W-mgEELtrDnq8-K4UYF0OL943moyHVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..de50d7a3c999 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5210-dwc3
@@ -206,6 +207,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
@@ -547,6 +549,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.53.0

