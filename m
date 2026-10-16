Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F23AEF59
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132625; cv=none; b=TsZybEEGKJkadJVuMRCDsRBLU8NlFYrtqw2AnD47n7u5rzyqWmEYo4bN3KMmgR5iv+veV4bmL+YQ7W2QFkJ/86DeUOOgTt77BQvArShbz79Jg5jtVQB/ijtf8LkyInk89kOPiYDthe4kId64K5Tj9FuJofIcvnRNlAEdc1y+kls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132625; c=relaxed/simple;
	bh=WTQqvgd5qbzY9TUSBvUH2oDxa2Jq+JX02wLUEi1lOPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFablG23I5fLMFl+QsEDMnUhYyQZnRcZ5aPJ4a/r3Aa1xwK3ep22DkUbtqWc8lw04UtgpbWNEz8y+avbHr7Q4PWIEV3+h1mA0vctgpPR5liLTfffR8mts1FtBikExn3xm4R65YZYrdopTpK1Rl4wfnBV0lsqrQ3Fu6vxVBflxDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3eizn/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ6ZeoMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3eizn/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ6ZeoMd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G62VdM2678018
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=; b=C3eizn/ftp5Npt00
	0alqYppoxsqeQGUUnymowE0Qb7fUkpeqlboJRQqeoWgTm6JoJnvcjI0iSmP0kRck
	a3tGTkZ2qlYMKyv9XbA8akMQgTACcTJVnIL6XN0UitrC44FJPP4paShEA2gHsSrq
	mMJTFHRZJlmtJaIgHFSYgxnumUlyjpZFiwMVb4o1P5dDeBTx8A/vZhoW6HsShvgw
	uQ+bq1haNbPCpe1p1FXAncScNq+DGCaWT74rj95NK++Vrsd6fK2kTxONZ00RqYwu
	09KISOk7ZKy63ofusDFWar9jwjgpAqMbiGSHBdqqwh3mlC935DZKfRrLZtzmmxxC
	yeBNWw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tb4bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:37:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso4069135a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132621; x=1792737421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=;
        b=cJ6ZeoMd068KbLEZSHHtEBx/6lJ4GVO+k8L4sgIeL2VmXxF+UgNnaEfTCQhRbmovuJ
         A9m1+wJ7nYwccFW89BQW5ozgQy/abC1HFRJB12ixVZjXkJGI9JC/NHxv/3mWc7Ftpg1a
         wCso2Y7GIoJ+Nq/TVFZjvEyvwAzZP+P074Qy9mZBhCyhyzAyxpUClJsiVwbxBH+ISpcc
         ymHxkZATQjRhso2uZhMiRP97Vym0BjLueC0Hndy6DH2dsvnxuZ4Bd2q1cqv1QZOKnS4U
         YBWB1oqCCLVxcIWy5Ah5xbk246E7P+5gLbRsKG3GlP1NwU65+MBmgjBVaO4nz9pYmuzW
         Wpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132621; x=1792737421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=;
        b=Y/FkWG698jf7weWVIhORGn5YrGtPhDSEETFqW5ZYe+hwPgSY+EHehSodNejQXHXJnt
         3nPUINtvx141izKnZcaJQoO4pK6KH2Xap2jRbBqhU/8jHeg6OaTnmo98ISXZ+kIl6Ngp
         bxij32VsT7DFmEreclv/TlV0GotKdAePrwg93uqoIpxVFWhMZoELtft9wS5uGOVnxjAN
         Iwp9zeAECJjXFcb5qNq3JDNKDnb3heuH5TSRhLJc4YZxXcBSW6sSljauRYGl9sTH5iU1
         zYZYCwnGKbCDWf7p36DeOmjCZZJV+wd7TwpEnbVhQ1meNARY3NmqcMv3coay+WdR52y2
         NhpA==
X-Forwarded-Encrypted: i=1; AKwUvByFPB/AwXcBfhsEQ52QhRlA8BftMReOp219zfeyuzbj2CkM8pkQRUk+LlFb+DTPdK77QTKRZ2Xfe+DA@vger.kernel.org
X-Gm-Message-State: AFq9FYIX0zbNbu+JHHDuZdk1EhpVgEuNTNn8veJS1jupZ1lOqqUmKl+z
	NLL2XZ1cg6xIcIti1sTlLFUyMeOvaGSuGF8UOeKfpZGMvMOgwi2on/RQ5pc4KR3OjkMRXEsHAYc
	e0af34ghsqKQxfnxyWzbqUnUVvCqFcLAOMsou4oiVoTTUcWqX7Fe/Q9cAyBJP8w0I
X-Gm-Gg: AYBFou2xm7kD2dHtqE0C1g01UzfuaOvW5QwE6uKFBSeGCiiz4FXClTnInzOMLA30sEa
	w4pE/0bfOTU2L3duBF2aLuiWl7Kbgj36mGqnx4vLE2+uYNyqUoeUqsz43XP43FbaIX5rfF+SeZw
	QA+P6weAo1lPnASs1lS1p2EfTniLQphaIh0tW52QSdlidoQRLWwu6zsfolt7wjFE9hB9RWNHfXY
	v3vprQjy/ajwzbkJvo+2D100YOJo0hMyb8hWh3+BwRCb45Utr1431pktYr+B8A/JuFeg5enaOUg
	lTnEXlCgmGHW8hh8IkHo6IvS3XTgk87++FhCI3z6fMndzapoOxC5yqpoTCzxJWzfxzO58McPwTB
	R98VWpAq4q6Nrv/FNqF4aoy9DarteJh8=
X-Received: by 2002:a17:90b:3cd0:b0:3ac:7377:fd4b with SMTP id 98e67ed59e1d1-3ac73780774mr6795840a91.45.1792132621364;
        Thu, 15 Oct 2026 23:37:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3cd0:b0:3ac:7377:fd4b with SMTP id 98e67ed59e1d1-3ac73780774mr6795818a91.45.1792132620784;
        Thu, 15 Oct 2026 23:37:00 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm2703298a91.1.2026.10.15.23.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:37:00 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:06:46 +0530
Subject: [PATCH v5 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-dtfix-v5-1-f56a8b94b4a9@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132608; l=1379;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=WTQqvgd5qbzY9TUSBvUH2oDxa2Jq+JX02wLUEi1lOPE=;
 b=Mrc9IOZWEdpsXnqQNzy20+D0ruDEPXdge5U634vqEFW/HR+Ap3DGPiVwYsvFOtQdBfRLWY4DE
 GaUdeR/eXxwBviLDC0RB45dDWECj6K4dLSB3+VS/R9t6s59ZRwVTuu4
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: AD_xePv-MadQxyHdh6CR6Z1V5AoWVlVV
X-Proofpoint-ORIG-GUID: AD_xePv-MadQxyHdh6CR6Z1V5AoWVlVV
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1c60e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=C3F15k_13UMA7PaxDcEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX2/gMUCaUtO5z
 Tun+oWPwxxpY9ge4+KotjjiN6/+QFP5GIWvP4W03UICpm03csqHaQCK/89HCD8hyrHj/zisAM3j
 +BybCfsFI+fGziqzqxfPgfO5mqkgltDkiGJdR/U6iav9q8eJm/pG24h9F4NUxs0V2kxFnQWjHqo
 f2i+dpKNDRa9v2WXorb4PiKJAqyPcCiY0jHrhypajzWhfvGHYc6NIlG0WvtBc2cd7uTEBC0BOfu
 MrXYdDqNYIINXgv1Pbqp8NQxYkKj9pnRLCWaqvw2sza+F75PeTHzfENkPkteH/E0WKCO1PHz2i3
 L0jYNHlEcTAw0KNrxsc8espKxj09n6y7Y6w4aJvP8zO2pqKrU/Nzu0Skgw+HgY3fre5Uw5G3NKo
 2sK7NB4yxD0HdEDhTu4AyiWV2z3qP8UTCJ6mSjrWTd5TLkfzrNL6XS801lOPrdo+j+/VHbCGow3
 nEevYGkpdz5aKgRGdgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX25vSKRJgSTbj
 QN5Z5tdHRMv25fRKb1i6AREiCI3zX6oScCbxgQucOcMTACCGU80At69hyx1q5eEQwxqlqDMJB4A
 n3+W9uAIDwszpLlQvY+6JjXFKJz4WlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026

The patternProperties key for compute-cb subnodes used [0-9]* which
only matches decimal digits. However, per DTS convention, node unit
addresses must be the lowercase hexadecimal representation of the reg
value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
respectively, which are not matched by the current pattern.

Extend the pattern to [0-9a-f]+ to allow lowercase hex digits, making
it consistent with DTS unit address conventions. Also change * to +
to require at least one digit in the unit address.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..d9444f452585 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -79,7 +79,7 @@ properties:
     const: 0
 
 patternProperties:
-  "(compute-)?cb@[0-9]*$":
+  "(compute-)?cb@[0-9a-f]+$":
     type: object
 
     description: >

-- 
2.34.1

