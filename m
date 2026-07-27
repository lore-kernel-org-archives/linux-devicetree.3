Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333E3DE425
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138394; cv=none; b=NjCSWbBm83A7rR+phw+5fNSuTv3JPoL/rmrnbrGFcaUoWcibpeR7a9Y4RoxGQq2ti4a55mr/M6Ri7D496C1lXt6wkDDvXjXmAOyzYjHoXQLlibLjlL8FTgIUoUeNOZ9YU1UdgwO1AtHqmBsr16ztsaN2/mP/RHfiRxKB/NUrhYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138394; c=relaxed/simple;
	bh=MB1vtXUMCpkuRXEQiZFl5phzdKm+C9dUzeZxDQlSm4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zeb+V8BrtDJQwePrcYNIbccQtzFGIbrkIy0IBWwnVBB7H8Hb4UoIOq8ZRwgsQFQEtyrFteQ6tK0YFNYidNSZPUxIP5LEpLL4H8MKbDWSpzWYsZsBJJJXMkXB6fJIdi9eWdzRxQPdiEqxcTUBfqRVdgK49ABCWCBwBfz76ofICGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFfTClyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O70R5tTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFfTClyx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O70R5tTR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7RhU32936870
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Sua
	xgitg4C4=; b=BFfTClyxbaVOq+Nwq0xCo5LLkasnefwIzwryXfJVqScxbTYbNEG
	ZwZsw5oSTzC7Tx1yVIsi+pB08VnosZ1OfFfE1v9EY2Bm6TyqjvMYa9LWlohPaXST
	1iPatRc+iJhhGT8MIaqG2BngK7FJoAJ+0YXiTV1oQq+LsotO9dqcQ6exsCRcS0ty
	RelEnJHHG6kGJ5S7JH11hJEBfeYbIuBJ3b71hEw8ix/zsXAb0meIJJAENIom7xXs
	icS3EGrxz/GxvvG7V2HzLLIq3u637PhDrFu8ca4o9A/NlC9EYyWCJLeqcpPvBRJ6
	cAcSVW28WYNG69NkD8wkL4NY5AE1B6H6X/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwevxae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so5087177b3a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138392; x=1785743192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Suaxgitg4C4=;
        b=O70R5tTRZc7/PR9vS2ULtadyMX/NvfE69cRi+3V6w962UWfqVMAZAeAKZl/nsQL87S
         IBG0/JWEQHGNEkta+pCYlppTDKkI0WQz+xin1VEs/JJzdv9udJfk3Ft+Z2ac9CfL/MVg
         q7E/WZB64FzMNGM1WlpIbVc41TLpTNmW8F9dDuz/wXYdqmxQ/JjqM2/PjjZ96Ikh+1vW
         vRU/Yq8bnI0TUxwwF23XZYyXi7dlFUU7sITb5BIMZcMbFWRque4RVAfVrlKhG+PD8q8l
         ggB8shUjECJaBtTSkAuuBUOtVdHz4t9XPjcPOjN34BWhjpVT6B/967iUQpIdPcYWP0hS
         gHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138392; x=1785743192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Suaxgitg4C4=;
        b=nbG0QEu7/cksK0hrxmiBvSQiD03LSesmwCIkKYR7w/9kjU34z3GxKMfVVHjGfI1Yf6
         P8+3L7cPR2tzoQ/KpZkkp/5zA200EcRvPwGdRsQwBMmLVePzJ0zzB478UA6BUgqcn6+T
         N4yMElGvwt+pnNdeqQdhLrFXcvl7kUaznd0iSeGwR/fVnLvx2gEHCRhkVBNdapWDuaUK
         /AUdKPVYg7XevgpqUX5LIizyHmiWgckttJUyGGt9MXapVP2QJj7bZmtnWPSnz3zIn2Wp
         yvBcaM9aL0pxVUnueBGdOnzZZXWEh1wbEoSHag44JKQ2iwKz3jTrTO46oj0iDlUhWKRH
         zouA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5FOD5JoW1YWKh3b3m71g7L0joNJEAhQCobzCVDxJO5NT/ybxYC9dssB8uHhzEYLe4hof3oRUR/4nV@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbI7dw66MmMri+315HbdqAsxLoQO9jHF5JIfPi0KJBBrRzVJt
	C6N2mueNAJ6h/kaXqN0qmmcPzTZHsxXEleW9viW/n2lakWPpuImNjwXdje8S6D0IXxxbPXdq20P
	PW+pf4yY1bKdSkcIqXY2MLBuNCP1pPSUpmW3T3W5VDjBPaLxFQxeno9NiVdJI+d7u
X-Gm-Gg: AR+sD10wuF02yUv2KPwftqHXisSHa7fILnH7Shx6cknHaMVNgbOcqZR1O9VrBzw2AwY
	GGJ6m9qMome1cg7tFoKj1WNQ8YQhYMH8H19vyv0v++X/1Yns11gZRyVc0ZnnAK5nLwdgUDs7gjh
	8gwCW38VTO7ZFpsYLoFbKkBshhjjl8kz6po6bt0VST9w650o+ZUFAknBLO0uIMbyCxrb268DoFd
	nu8Oz+q3OaNWYWeB5HIZcEP6BfO4h/2TAmNcHA4NwgLZWBku3TYHobXPXiEwWMMxPhdO2aZ12gi
	jtAMFOUDo4o6nxX5kmGUVA53dlytf+G8Y2losUyA5xwBun/Y5wNAnbF5CpBlNjyDwVp+iHCP1Nd
	/ZqMqX/V35JpdX+88U1euyp4OOsIqMBRYGD0WU9toeKOLmEuamtD6yCNBVo0o
X-Received: by 2002:a05:6a00:4218:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84e5942c19emr6252429b3a.16.1785138391867;
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:4218:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84e5942c19emr6252397b3a.16.1785138391394;
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add ADSP and CDSP support for Nord SoC
Date: Mon, 27 Jul 2026 15:46:18 +0800
Message-ID: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfXz/WhIlCME7xG
 2gu0KqYE+9x+OrKLuL+5v8zDP7+HBp3IuX5gcHIrClbRrI2k+5u4NnEIHVBMMRE0TkKUv0URC4k
 Z4wWebHNUgI0QFHL//9KzXNouJ2K4obln8vjeQ4wmiOPQBp/oFxahEnZoA8BFX5EaWqCtEPdBL1
 RBY+nqVK+sAiPdaIHDxvJlIsYBC4lkveNuljnPUQHVAfB0xNnrr6J6FB7+8YqAZL5zGv/ykQn9N
 GunFTJ1Nt58Lq+vP1U1DIJAPBjn1steG+pgq3PVHPqjX7qWIsAqFh31UJx/ekoRg1Ff8Y8NtG1v
 bSP1i9v6aNN5pj862ouJo/5/7uBrzI4fVasqG8UlB98+nHtcloQKufH4WLwZlW5uVLgFg+MhL14
 RE5CokmSMM2VXVqUyYXdd4AxHArQO0BzZAyFRW6R88UF6YBmIG8304nJnEonwPWu9E9fMxgYn48
 t71s2IpY9g1avmeaYvQ==
X-Proofpoint-GUID: nVOCorABZjivSFAD6axK74NZwKlJdxwc
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a670cd8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: nVOCorABZjivSFAD6axK74NZwKlJdxwc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX/SkVWJFo5+Re
 DKiA77GwAJCFfddsw9nxGKc9MKcunzW8DUVmmyaGXWWb3hYZXFxrRby7OliJO591v/s7FitgBmS
 5tjgsKFtz4zKgIapq72Yp0fzW2u3yYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270076

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v3:
- Fix qcom,nord-pas bindings to define "minItems: 3" for CDSPs with
  an else clause
- Link to v2: https://lore.kernel.org/all/20260724103848.233804-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Create a new qcom,nord-pas.yaml to cover Nord ADSP and CDSP
- Include CDSPs support into the series
- Link to v1: https://lore.kernel.org/all/20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com/


Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
  remoteproc: qcom: pas: Add Nord ADSP and CDSP support

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 110 +++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

-- 
2.43.0

