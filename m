Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DC3EB7F0
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459933; cv=none; b=D9DWFQ295yL18fhFHV/y620FrC6CJ0/MqRi5Yu9gQ+XP8ZNPNEf3YAaKvCDQIrfm6tjXINMYKV4FlcDcKPTBfd07uv4sWM63fmeJBpamk67LPAG+DVslJdksHQwcLLnatXJmR4Z3nR89F+bpxGKK+K2y4ZfIKXqp2pZ711h+wXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459933; c=relaxed/simple;
	bh=oc0BUGs7hxS62BzdR38BKFZMTtbi6X5LksJcvy7Q96Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJLX8poUZ7qOO6qu01GBhncrQYPM4AnIgqZTOrPNqVEcfE1Uqk/A1xmQWhZ0ODwqFsHb1tsovhne5mTp/j6/NttrugIwh6FYd5WIYDCde42SzxV7v1CePkkM5iC5s3hmSzQU2f4ijraz9kOhQTdPM+rEUJLcy4QURA83WmQp1nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5ZipRlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cG4e4vzn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5ZipRlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cG4e4vzn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWgd2889823
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=; b=o5ZipRlX27n56NGC
	DVsDVd6fOKpSkNvWWuJ7eHNaCFX34RFJhjGjYCqRMReuBnGo1CPC9H2MF0KBN/aZ
	JaIeuSLvhmmXlkOTenPBcPHmSJknxFQmGpyoupI1bK8lwEuPCLV+TNBga4u/pieG
	S56BUHGfS7DE2xhUKfPdvN18vnByQX/XovjsYcyY3Yx4RC3ga9bBDwvOYKQ6qyNf
	VoSy+7mosFI6ZrmdBJ2mcYPcD8T/WvxMpghgAAIKCY7HzwnymeDwzSqK3a9I3dkg
	OD6kiHY1vTpVoQX+O/Ocm9NoeDGyJVntjVFd54keW6lzmthEd7Lt9AN+YseP7xLT
	Srezfg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqbj73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ed279eedso86371235ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459930; x=1778064730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=;
        b=cG4e4vzniMcrxjx4N6f5owOAqodrvehembO/4JHjIjmsguG12hEhrQHxdxO9xWud4D
         Yz7in4UeY1sO/9896Z4YVYlrMGd86KIjYWPoUl9h3CfuU+S40LoldcsDB/5eCU4uo1zn
         y+egCyGaJyKfFDspD6BJHCGBRxT4i8cqUPvsw2uH7BXy79ZxZdzFf46hPzSMCDaNBB3o
         mj09zbSVAuRA9eTaigv4dfGK6MhFyjcL3YGGSHDmSwV+Po25Q/Ru+XVxHEqqRe/i1Dgw
         47c+fKokR1JNKT+WVrGHyi4dTpiOEtyIAyz3978S9GkNbwGTRuOObW4U/keMYQza0GFh
         c21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459930; x=1778064730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7L4L1oR9Ld6c0Aq902NuNggR2GtSSCW13PbHPuvGbI=;
        b=I1z1N0SpxkRmJNKizLlOLNmYceIp/PEec4+NOFQ9qvuwmB6kge8wJ+O9yW8rDFm6rr
         lJtIWOh3BNIYxrs+Vggvlo06SbXLSGjolajJPYQhjiMs+7ltW+bYwsRSh/h/Jmgwlvc4
         zX2G0h+3k35iCMnNTHA3/KG1kfohL3uoOfeM142cnTdvpNLSUD+8/h8kvp7hgUS++xwP
         3UDFTTQskInr4mL8a+AQLJNsj8SGWCHVdpAAam3UMAUUPixQ7FRJJcOSInSCE1Sk0NJ/
         mhg6+adL54gvj2z9LUuY5JIXUAQq9epa+ZUud2Ieax5eMi6YdYNKMkNTL86L+p/mWia7
         S23A==
X-Forwarded-Encrypted: i=1; AFNElJ94B6fAh1zUwHMSpu+QPK2j5Bi91vUU7J0l2iqNwP7gvBCbeHv8dzDhTIrN5Mdx+msMc/nIXGAOy3uE@vger.kernel.org
X-Gm-Message-State: AOJu0YzF/vu4g3/tqAYCnspziFHAO8oqRu7Tof478NWOKPfeKDeBKlUh
	nL3CU424bWYm1OrZNFDJw/AE9uCRSdFkxTNxKaWF55lYwBplApfZvreE5nIeynJSHnzIx2IwkZw
	nYP1P7o4zCgx0SLSL2vuq2k6VqI5LmJRfRtrTxbTxxtAhwa2/vY2fDaN2E3O26QpW
X-Gm-Gg: AeBDietrKdHz6MAnyIZMHBrjjqpB+BcpeZGzPEwMIeVDjZE2/Ifpzg2y/qPangZZ45T
	E0QleE/nbPKo9b8QAVrJPxFPpvBrRdAKeA0xSroBNrLvKqn9W6KjaderOlfpO1zJnHW2lLZtBmj
	dffMsa1tP3RG5nMSMGwbep8hDcET0quNxpl969Hw6gmNtJLEY9VuMMdLkCix1e5Lg111jKAI/vN
	wEmgV51bh4gtQnA15nmd+nO5IfmM2I0gSyallxFphg9/jkMxa6kzO5zuINs9X35l/LYBV+CN/XE
	b3cMZkqXpB0OU8/m+KMpyBVtCakXCbQ1pOE96JAIHpEnTuhIpBXn0wgPnaW/JPpvW13l9vQOigL
	nMSZ7i2JUqgXJJ1Snz38NQ25TEzzfVb3UyQSvGpW29tjX2je+6aNb1kZHZktsjYw=
X-Received: by 2002:a17:902:7b8e:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b98730cb97mr21791865ad.2.1777459930286;
        Wed, 29 Apr 2026 03:52:10 -0700 (PDT)
X-Received: by 2002:a17:902:7b8e:b0:2b0:9c2b:641d with SMTP id d9443c01a7336-2b98730cb97mr21791725ad.2.1777459929820;
        Wed, 29 Apr 2026 03:52:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:49 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-1-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3J8diHQlIMS5lRhv2s4Cfdf5Zz_BfHl2
X-Proofpoint-ORIG-GUID: 3J8diHQlIMS5lRhv2s4Cfdf5Zz_BfHl2
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1e2da cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfXyGT/c47KjqW1
 dkwrxd9oZ8JuktoDI/1gC8It/dVkPON3H8MrwOtxB5XJQlZ/N93CSIGbTqLW37CYw0eJQKUcX3j
 Xrnvil7dTph3w9EZQA/BU2BPEbjFW9pdcDLiO7zO1q3CzhRo2F0zlQFMSw4wNJAoTRABCjY1LEP
 cob+6Vu3tfLf+iDmz9boUReCVTUJ/HY5eRt9Jcrh+Pv3J9n6EBHS8zSa7sb2CTzRbw7R2Qy/ioa
 Ng3hBGZEBhunGlSte+wZiuXCUtTwgjlPLty5NPX5uZWbk2Y8e/omugzet6I87gw4f3nEllDxyKl
 uxVQhMURvr2yP0Vte2/1CeNt4gKqJY5lRiFw+41oHcA5L/wD22/nVrkbkP2YAUDiYi1lk/uD4GY
 5CsJwAJuJ75AyUvuocm0/SezukXje+vE1vI4tcUPafte8TT2uhfb3IFS89T4RchsB739TNTm1IU
 0XZSbdyP4cP1SYnlzNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290109

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1

