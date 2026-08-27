Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69EC4A2E3B
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853191; cv=none; b=UldDTFv5KIsAo0Ffo9jFCZzRhTBkn/OIeHFLNXJvi+Ft2QGd+HDF60Z2NSdwr9ESda1F26MMHYFVr4sJxabD/QPSP3wrX/cGru9hFpFrfx6CYAhKnu6mKXu3bCjFr2z7rukHd7cY9WmibJ6i9cZk//qu7FSXnHpp117EKEs9Im0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853191; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6FvheDbnaKkgzEjKg0M+Y7cplVg2PyrCRjxjtSz3UnxTtkCANCLuFh7lWP34wnvnWyEKoGsxxUUnvLLeO5dPQIt3+GwR2LMSqr5eV8i+8FiKW5cwrmUBEaALgr0KHYPMIMO9rE90YXyc7T7RplkjTSmuZWoLCn6oxrry3gSPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgiw19cL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGcgK52M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgiw19cL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGcgK52M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdeS614573
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=mgiw19cLbzJcHRK7
	VwPAevQ/8uyHAndrw/snc2A7t2KInmw2k7/t1GZQLI5Uu0SxFiXzsU1Z8HGkH0ub
	cycv9V5eCxMoxfC5Cf0jpCUXs8i1uThgt+SCm1U6a3UMKWlnZKGlcgpVoqAfQHW6
	li/clZWX+3ik3xxqlm9zJh83itxcg683aGzkaaJ6AlNvlF0x35hQnaDWyd17XwOr
	GEIkEPvuUUHoq+XhI0nv+XRTtFTHfuk3csTxwuecRqaN9ap+R1tqQ64vMukLNr+l
	tU36z+SwvLHXS7vW0n7oWXZVS+xh0uggurYrejOaFxgyHdbN5xFCWKiV3sermd9e
	hirGEg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr6995k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:53:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso15399625ad.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853188; x=1788457988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=dGcgK52M7ZGVoARJyAYUOxL4BHeX75RTACBSx8YUmK3cSBUjse1FDxTaRdIMy0kW6y
         2YTLSuQsicw4nI+5Y5jUgGAd/BJG1shY3YcfMutyzoSKbv3MMOpkULtCUoNM2jwMEEei
         Z4is5IVAzY8rmXO1D1nJLYHWWtIs2o/yFUTe9TMxgDMorlElu/7y8+pRFKvx5mN5+HFx
         kQe1GVoswWXaq94VfGljOVtPr4k0sTYwK5vsyUmsOuQW8TzPfJfqkw4Dl83mNsWTM+FB
         G8A01bEWhABrIR7fXE6h3KEFIr9ANtPpmiIgQybUTr527gPMkwdE2KWT4tFNM82ji/TK
         n9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853188; x=1788457988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=DCGyR0ZvPviSl8pcaNZD/kXmX8aY53md1AfCxnfqNPnAQumUFUtv3tlp5ZHOFZzkTt
         fpqzQNwftqaZMrTkShAiKFw3K/fZhEPg6qpOG0CsaMPxwhUT221G3L0Y8UiVEK+Qi8ue
         qIpRYWGpSGnZxNVPzyKXq+AMDjXXOZVorgBrjP2+TFEabDDlhIr9RbVUaCn2tEGJRqr5
         iq8uDeQLZv9AkCSd/UhLzhYAnc6j464deh0TVD77fLl5TglBkNzvGzWxlvdEoI17DZ6W
         M4EA7AHbqHa8OpbPv+7TkCw30/iK3dMVJTsIP7eDt32BlySaC2zWnnzf6YmSDCqaRqV4
         jbLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzuqxVQruIzAiCtzjG8oJo7tlKT3h4Je/JMpe7xADkoOQSR/EmZWkFUeic3uyYm1+BEkKz3rREGhd1@vger.kernel.org
X-Gm-Message-State: AFuF++nNhDLgcsJ72VEyG64wLezmAZwY8hyM09W30TMxZ08bS5q7xBCY
	GPUbYELqIcYEpAjOq6L+ADQlMSkK+B5HKWP/H4+mPtb5YBSKJkHxUpLb0GyGp3Z+kJ0ux9y7oqV
	9WpwILQf3FmoKd3D/8eZQSvKEmU/jH6rzInR6ISbQo3c9FsihHNv1wbKkiYIAwUfR
X-Gm-Gg: AR+sD129ajwaNKCs2aOoRJnyIhQSTgCXoJ+TSeiM1axOSAk+LoRRkwv0QyPxJ8Sv9U9
	djwrmcDrLDQ+n4SSPgLaEhdG50hl7Xu+LacC2Rfm2d1xUr0nHAV+XQAshnj/wPlntLnVl4fd7CM
	ngwc61SqKow0+MFh/0Yw0P9BgCHr+aLdETcoRRzKay7OqIt3+FIx9f9m2rK8LxW1uiOcV8Rob9G
	w4nA3eohwG8wFcpOJ+wKzDnE485b2+5XMGXo3ocuVEcxLABCGSei9FJgjIfqJNDGIX8WpzH/Z++
	5xIpFlWyl/IuJTSCfgGIG7gJia5dcH6e8a7s95JNmbtrnm+ME911sMRwpi+AMwOE5WhwWz7izeD
	fedg2xvJqXZvoNBwZyEguhCZtCJmb0+4ec+i6g7XgB7ioN4KDGxHF57w2NhCKLZgViH3MAf1I1u
	UkVm5Ye9AuZTaAagUqQM/dN7w=
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108846285ad.15.1787853187600;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108845825ad.15.1787853187160;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:53:06 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:16 +0530
Subject: [PATCH v5 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-13-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=w78Pw/hDL8SLhPCEJMXKoxFhO6U0UOpZUF5rYcwLAwMKc44iN6Fghd4LGUQo47mNIYLcxJvJo
 zAPLDw5OR5UBab9ZlI6me33T5i3eV780/WGOyOnbwyhtJdakaPzl5cE
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX4Mgv1i5RkPbG
 KF4C5XbJK+nvEBBhP0ydQXGCEOAgwEO40tjmwqgX1YSxt3eQuNw0TThSQ5irITpbrluqUVi6fzp
 mzTYi3/IcS5SMFqjJkfFXeS9fvGXNhKT3hpCVOxw3mJp/Axp7PKInIF1nRv+rkKGG1raRDE23+g
 CahZ9+x5zyZBpUikvK5Qic+sppjeChnyzlzkFH+mbguvfAT6B43Fz+RL1o+0UkjJhsbkSnrKEsW
 +dk1OKAZdxm2oSXcpJM0aqE/fy0VEifwU1k5sF6ug8sjFFNscTwec7LLL1hpSTY71KgVD9ohoFo
 V4L6a3hv0knBP8fJL3QD6jL22gGzo3/3z8AVAYjl07roAeMPsLS6OrBN7MPcYYVRHEMFapW5vtV
 8GBkkmDzOh8DYwG2MBURZhCZ4oStf9Ivao+iHOW6oBGw+Mjqxqdmv8kBluNEYyxWNIgs/02AgZc
 vhObl1omqWJ4+rVkBOw==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a907984 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: -FcaGyxuKz-eOEjqAwf3B-GcbHn8lIW9
X-Proofpoint-ORIG-GUID: -FcaGyxuKz-eOEjqAwf3B-GcbHn8lIW9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXyKHQtOyokBSA
 oF+HQ8CYnsaLaGPQAb3hn+Adr0bpCgGDH9/FdaU6Tj73026JSgcN7f+Cl32loFEl+l/0N+kEl0U
 nMO2ckCT+CnJdNjjQMjT7hliXWMP8vg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

