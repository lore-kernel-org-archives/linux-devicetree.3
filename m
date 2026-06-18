Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939CE33A70F
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803316; cv=none; b=EDDkP1jl/k5ENXfnX+XGWMQjrbvsDrgCMEpJU+caGsWoCBrGCYgRIpF2xhnqKgR8z3yl33EhLYp+d5tfyj9U1UCiofUS/GK4FyxmideTS4ZBLIgfXw5VlcKgzbBXMyxkuc4VyYhlrrExsH/fYMA41ZDlMrneoSkl4qAn8CHdLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803316; c=relaxed/simple;
	bh=Qcn9omGlfSZM1RD4mLtu5/9tTLSglTD/Uo++QbqEPG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUJ9yvv4Ty9qNn9aMP2UlO3CU+hb6tHtzs3aSQ0wZ+6M/UgV3xbQqjZkCkaJL8jrfj9+EFufoty4yNXEByGV+6r+IOkKR+ia19vZ3dhpHZ86GUVENp5cTjECBcLhNwjEgxJl4bbisTX+WJnOaw7C0AJ0n+jMIL5xKQnMxGxTD8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaI1f9GL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qbs8w8iV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaI1f9GL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qbs8w8iV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IH8Smg2443621
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=; b=FaI1f9GLEbHxsJQr
	e2EVwGZO/eBh7Ugc8tmgJDpcdjuERW4Cef5SbPk4YqaZfCs3tSmkTvyNUw4arhzm
	yIyAkQBNbcBz9I9yc2Fg/PFqOLphSmt087jX9W+DsL8Mk7aW16Hhy6sFe6jpsa9S
	jYtxMwR0sGdErPC0u/Lue1Hwn8qJ7h+6DeTyYu99Ke9ciLoY6VsFwQmGILDMHX8i
	nZrarzMEanlX5FI06+PVc+SN487MpmPt1qC4PLcZTRAaedquIm4ZHL98ojoxGQRN
	hKFTVc+4I5pQXgvIBG+9k4oHPN33i7AYupJa30symh90w4GsFEyUfsKUGCuuPUph
	xlcDTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtj829g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:21:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so1348056a91.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803313; x=1782408113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=;
        b=Qbs8w8iVlmBLEkjMCtvixhvGMAk8RN76nu3iq8Qn1vbl614BfHo+N9t0U9dpSKDmw4
         ePaX2vVoLBMrCuF/IXw8uv6ezKlqOAk70tsWGL7FbNgMbbwKMT0wyxBBkqTPo6eaq3eC
         xxpFeaEaIEzVOpHV0wpbMpJDiGGrh+5QEJ79Lg/4flvAwkQxtnnt0QVPM1wG/J7+yMOP
         D8JA0aeyonH1QHFPo+bCyo82g5r4X/jY5iBchBzFPFfNbuYBr8YF4jtZFh2trqe1sdnn
         nICi7xdRtCkd6RJ2bz3f6R2E3K4RVSc22TOIRwWU2aPeFl8sTq0F/HXu38KcIWxS4C5P
         1/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803313; x=1782408113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YqcW+WgA+mITj8DAGt88WnFHZvZ7J25oGo5K8j/ix1Q=;
        b=NfwAGb2sYH5RxQefLBiUN8axHMJUMwNnWFUuRknWRLFc/xQNXg8nSOsSXTuyQAqomS
         8oanBGdYftHaNoAjy37yBHMUVeYa20ekLflhirbm+C5ljiiT8CWBQRgUld+ARKcuyAhU
         7sNXTY8mNe+hcyMZtQ7ccHKiJFrBslkNhu+IdgUFW9apJgjV6inHODohtwQBisk82Q3l
         vPBg4uQDPDJAwnx4xE5DNOlYAjllO48Hg/CSw2ZDLeyB0hMn0R+1Zmgzuh5zgxnx7Nho
         dIRT5rkHR+pWHK0R2ksGAYRKDGz4hQUgaEvVGCEEjY9g/VGFZVBG0ATWDEzH4eo9kvRt
         nthQ==
X-Forwarded-Encrypted: i=1; AFNElJ/auvlNI3uU4DQrxXeDsUxDB3EGitM+z+fcTSIyu5rEphVF5TJmimR0vV6B4whQyefA6FGE7RbWdaHf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcq/Chc9RyjJDAYwc3wk6KsJHUMZxG9dPyAl+VePDeizaSDjh/
	RoFK79CkUl89540ZampT33tT31Vl/N/wds9s30/QU7iCsGQWYAYCWCoOAYt+cxRq+3ZYQnZgqX2
	JPmnFdHWhtBuA6NkGiqvvNcPOJhtrl3MB0GFvJuImCzzCZ1xH+ZiSUxu0NZEr3PtX
X-Gm-Gg: AfdE7clyogn2f1bo7dPhK3xq3ezRQBfOwwlZ6pB0bx90lbxvOzPohV0vB42Gad9bH0b
	opIy7GYZAcypFL8133jz88pvoz++QT1iGUorhNXoVgOnM+7AUpO1rdeia3mxn8abEfpf2lQLNgE
	fGMofAqkpzdZtTI0esOH32CqJyQoQNbGoRo9nuGrIS3EL62hDPv7JV2AJ28ruUk41y3bxtJ5Sgu
	9bQuvV0aET0ziAQxoH6UhHkQMpPOHliJqOvhn2IzczVagDpA8ISgyf2ybx+k1v51FNZeDbWowA5
	ur8+FagBcTR5OqcjJzC6w5rqcRWhYqsDb2IxUtINNQKsBiuVpa5YUnMZZqfR89rck5bqGQnDYZH
	EJVt7SZ0aWXMwpuYSrWkXRL7RmnpubLr9wug=
X-Received: by 2002:a17:90b:3c85:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37d15e63243mr359559a91.14.1781803312745;
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37d15e63243mr359520a91.14.1781803312329;
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:20 +0530
Subject: [PATCH 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-5-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX5aC3ldmq1pW6
 OJJEraWi5kQUta/fSa3JugsXc6oq7A7Xx+zakWK8CgfckOE8MkHe/mgIHGmg8C9DWWt9VUvl5uT
 ldNX6SShblars//WolEByeGvuDNYaJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXxAZf7q+eF2GU
 JEMK/isDHZCtNNlhnrqLHppho9MMsrj8n2H4XvvAzylJumUA30U+TPN9jH7URp/5ERCFwqTa/Jp
 ccMfufle66BU4y7SV+wbcDltJCWRBBSdXno44zmr9YE/G2VzTusZCHQFqtYyKYB2/wKjELbsFkQ
 F8hYhm2v7aTsehpGY6EZJtGGu1exADHDtBM48dztBW0AeWfXNEv7xXCkNUp3fhyYUxGdabga+dE
 0Kq+yCPpbMZ+OAZ98rZvSwWpCTKsvyzTyhQUi80Iuir10h+lf/vXRFDhsMRiEjYjKToaTC3NzJx
 HLhU3zrzL3ZIKEc5SgUmKUc1x4AGmOlj08e9XtF1Sw7sev9cir3dZN1XMFlZyHFTp5Ta5isJVRM
 rhMo1e5DO1Mt72ORjbwefN++81JwKmmkJwqYpeMhJCiVjQ079krSJjGcdIzlcpwZtpS0mqa8oXB
 xkLXjA3zkP6U/ensMZA==
X-Proofpoint-GUID: tz0xtguU5oQpVpzAvZGrh38owbZQkMlp
X-Proofpoint-ORIG-GUID: tz0xtguU5oQpVpzAvZGrh38owbZQkMlp
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a342931 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1

