Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FB1E1DF0
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253491; cv=none; b=OdDX2yrpnDO+QzkA67zQ5sY/xiTQrdvCef9rq2XzRsPMZVs18npjK/AbdBtylbDce0hddHvgzxORg2O69H9xuX3mCJLUYXGK7F2oMot9I0/+umksh4dQNPyC05rytrvX3rxB5ti/Vm5uy8cj8FuOt4mpp2zT2dgw7B8c05eUTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253491; c=relaxed/simple;
	bh=fyTQen4gxGRWLtVzQALD2SP6tF6oprXtAxdffqT5eCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ti2SMMVtNFnx1rqfdX1FqEH8Ghe77yqYR0rr5zoq2m4vIMBJewisi+TYjcjpuFm9HCMEdMbZ70aCxlY8OAAGE+T3BGdIw9fZiZW20FGxYcp8v6lEDN3IWvX+zKGmU5fc60H2Gtoz+8YoxhEb4TpsFY5DcI44Ib5PdmXVzwvYU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmvhDyWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1uoQ9Ck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmvhDyWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1uoQ9Ck"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QJ0Hck1212908
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/0deA0ZT7ywlL3EfI1B58TJqpkBYFgAu1RO
	OeM6Ol5E=; b=CmvhDyWO1R4DJznOWWQnKV+ybh4k4Utzq50ipaUNT/WcqTaVFHB
	HLha+IDZHXnftPqPcfjzcxHMmZcfgDjJfCf93qsamAlSkaNAhc2i/tbukRApEVS5
	dwsR2pb95yCl2mc26MMs+WMfSgnSTH/yqwIt6IGORJ7477/DiOfqOCWWqfC3OGwc
	S+JdtE224EM8IvGTkGne2Xy4adsTnCs1lg45pLNXboboLj1hlCTqWgTsJbSqAgVo
	swzDgyKQyu2J2YOntuoO41tm4QJyDEZ5PMvqIJ9aEJXlE2yLZaSE5C15zXO7FS9a
	kOhQ1kJLqzu5dRFBsZQukYhQ1Rv2XYlTmbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3w2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2de07c12745so29358708eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253488; x=1777858288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0deA0ZT7ywlL3EfI1B58TJqpkBYFgAu1ROOeM6Ol5E=;
        b=R1uoQ9CkUtlO6I8DcSgFwz3I36TiizQOxIfoXSaXXML3VOtISM9Inxb9PsgXhucES9
         6pNW4AmVIAqwkSSIQBH0NK+/w0n/fNIeSip8yfY4lCSj/UwSnTOd6eo6osab66A4QLjf
         9RTWe9f2vqgdwvRywmSCbT+ZCfbj6b2BGGN1hYJDFRe7zrMJ9V8HumnEIXfjebQ5D+hG
         wxgH1x/eLpOSDy+k4Mc+y5FmuQ7FjZbwFdW2sJcGg1oNUSI9WQFpKwDBawkl3799dDiq
         7JLg8tZrQO7kEJLPMHLkaiYmws7q67vmVVTYIBQjBUOctW0pp31RtCEaemwJGqZqFux/
         7nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253488; x=1777858288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0deA0ZT7ywlL3EfI1B58TJqpkBYFgAu1ROOeM6Ol5E=;
        b=eqIBDCzjhcFu/oi1MiSKpaWdr4ir30t+d9fprJXS0t1jQ8tdeeiaU+UwC2gvObbTzm
         34BcqJ0aqVmOv5FvdKtsRNijGRHDKhCnqQ8KZhCMXs8swOV6LTAX8mgKjZ4+O9hhWHRQ
         j0CYDrlZmeExdl9PresNWoFyPcLZNTNlf0A0ryv+n3a2MhS2aeEpp91v9V/5u1Ysgx1c
         cQfVVoXDRQJIEUAbdXH5HZ0R2rpBz8NP+dMB8cjIxYpwyRdin3XaL7408uocX28b7Wg6
         VifmTIGh5rIbpuY1+j4Gyp02I5t7D+7D5JHtUmKGq/n8bFMEnPGbkh3nNdH7q7LXGJBe
         tsIg==
X-Forwarded-Encrypted: i=1; AFNElJ+mRSci87DakgTmywTq/jS1+9KInAXUhln1d0qMS6R98N1Ayzf9snGU2oObe9co64rYGSbxGiSpu9AN@vger.kernel.org
X-Gm-Message-State: AOJu0YzWzk2Y36PnyitH8YPanrpNzVne6NLTYkzRPZYGzdMGXoZmryXZ
	9xg9ITLnaOFsbWl5F53SmS0G/5VLWegZ1gJYtf7DZaCpsIPllTLMXUUJzeiS2ln0g+hNfl9Ewns
	omj8ys0g5UPrA3EYI0S6CT4O6cLs9FfriGSlzzkBnPL7buTR5J80cZeeAZKXmwwgX
X-Gm-Gg: AeBDieu7T7pBjTElbE/UllP5NdAB3Ik/Kk8+Dgj0l+7u6kWsACD7uBqY949gjseRy3J
	+ZK7RQwolc3XYfrDQRqF6lN9u70T/EwMvmjQdYBqpD3yKqbiJsxdJ2Ndu+zsqlRM0nkeFWjIE1w
	CPHGMoeBjjYu6gv2iAVfsfnljv4ocx3bmIXcUjDT9/RLogLIqSkE0qgh9GU+HigGFcrSdkuJTFT
	rlO3pKNFNoAtZHg13NITthTvJimY90bh7t2ZQwJuYP4EjOqcEi8Odnn9mWbL/2FpiyWzB9N66hE
	yWnq+18UbwK53Jit38lkdgcCeaZ6VEQ5j6KLmHF0Xg2oNLkMx9eSWKOjG0R9OJVKZ8cl/1GXFFS
	kVzLuzIXwlhWqaCrGwPoC3zur1Jxq+y+Yg7ELI4zBbPz3q1dTuqR6CDwMQgKg9n+1AsZo1voM0v
	vBZqLQmbjeWVWWUN7N
X-Received: by 2002:a05:7300:8c9f:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-2e4660475e5mr20976473eec.3.1777253487983;
        Sun, 26 Apr 2026 18:31:27 -0700 (PDT)
X-Received: by 2002:a05:7300:8c9f:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-2e4660475e5mr20976447eec.3.1777253487461;
        Sun, 26 Apr 2026 18:31:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52749042eec.8.2026.04.26.18.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:31:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] scsi: ufs: dt-bindings: Add compatibles for Nord UFS controller
Date: Mon, 27 Apr 2026 09:31:13 +0800
Message-ID: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nd9vU-pEPCjkQXJyEvIGVj99FGvu0a1r
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eebc71 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=85fteHkqF822gKl36b0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: nd9vU-pEPCjkQXJyEvIGVj99FGvu0a1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfXzfBQOxJgqkFC
 iyAjC1Ts89Bwua1l5kcczZSuSar8pdGVgGm2oi6Mf16wpKHIj8agYvHP4EQr7+IAZ4145l0o3wG
 0p3hDDd/h/2Lh7upDiXNOMLlYFzrftMaUIeZLahfLo77uJ+aO6I4kXZJTd1Q0m883hAUfhnGV6F
 nSWtdrbUiNzgey9krLHx9d/xHkLTx/ngDvv2zuV+tr0OkEPE67wy9NPKxKwOLXGqrCwjqukOhSR
 sggBsB3pwYeZqCcOlv93eeDbM8fkB27Bpw6Mdvo2LsBvHkwTztTIOVX1VUngH3RGWz21MsUR3gm
 WpssBUujEp/wqUrybdM/8qOo+vQwpmHxMDsm6GVo301SGQ0Mku2wRPJbeGInX8uzu6tO0RZdpUb
 9pMnSykQkeJL3uqc1FgBnzoYmmoprOdWMiMUhF3MFGI+oLCekSadXWqPixEOSJffbaa0em4ABcQ
 zNdSax3N00eDwhVzfmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270014

This series documents the UFS host controller on Qualcomm Nord SoC.

Nord is a Qualcomm SoC series. Its UFS controller has a multi-queue
command (MCQ) register range in addition to the standard one,
both of which are required.

Nord also has an automotive variant, SA8797P, where the platform
firmware implements an SCMI server and manages UFS resources such as
the PHY, clocks, regulators and resets. As a result, SA8797P shares
the minimal OS-visible DT interface of SA8255P and uses it as the
fallback compatible

Changes in v2:
 - Keep the newline between compatible and reg in SA8797P patch
 - Link to v1: https://lore.kernel.org/all/20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (1):
  scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller

Shawn Guo (1):
  scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller

 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml         | 6 +++++-
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml          | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0

