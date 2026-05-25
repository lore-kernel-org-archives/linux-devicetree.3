Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0157439B94A
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690099; cv=none; b=MSAxJU8QQWVrR8649BY6w+fyTD3qIGLaPLIzfLXlI0QAjUxpffssHTGba2FsRkCvfv9Y3JfXFaDX2MAmgigvtC3faSZIIIzxj1Ls7wtudcnijB1/hJ9+VvtO4wol4HHbA+baENsc8sLyJqQ98YUJkLX7v+VeXuuZvpl1GIUDJ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690099; c=relaxed/simple;
	bh=SN+gsXJCUTYS3QP/s7Ozjn5Ljc3dX0Asz2QRaKXR+Iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=htVF7ikccnBp0PWcNZmaA7dmKRBqNlm28plmE6q7d9od2ZpVm9x/FfA4EcNoiDEfkqOfgE2CPbX2lOdyWZb3gX7xgC7Mid3gbGRhRLmWd9UMbsfbswJSci+i/H49NK+7LIzIpvQBL4hqZew1aPvwjk7eflcUy1b1BuR3WxzsSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUCiu2l7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrTqhXnY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUCiu2l7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrTqhXnY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OI02kC2442267
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VH17n6noNfw3rfLs2gSqPu
	LuLSe8f67XaN2dj3fT22o=; b=TUCiu2l7F6S2kbpTb0WkJKug5J6GiuM57RyN5X
	IjgqIi4FHRp+MR/mmA9G1K/hGZyD4FfSaA/W9PH2CICB/FPzFxyFQ60SnCUNw+Gh
	b1edEWz5yg+paSzLAnSQy4CejZjE1CRYsNzhJ7Q1TElnIjh0EAPs3OQLyKBm31ho
	nV/MVZUybpvWF8iKtyQAIQX7Yyws1dMymTDqr/Jc9FQeD7snOuFporaBC0TnCs1o
	PkeoUeg5poVTHklap5zzhnEd/j/J82AJ22K6SLDD0JErYoveKW0oSWYTsf1hgVjH
	8KVRsgSUO7I2fr1I5J59n/1x/QloAOCvmXGGHTnn8p2zFtmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t5ddv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:21:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba838d3fa4so90848665ad.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690091; x=1780294891; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VH17n6noNfw3rfLs2gSqPuLuLSe8f67XaN2dj3fT22o=;
        b=KrTqhXnYwds+7z9OBU+KlVLPZrPVzJi2lgbqwAatTfmvN7grUYVq3ikkr/b5r9Q3bm
         LSPi7bjIWXfuC5TbsB/p9rBJN7ZFdrv9YQDB+Bk/5OSKOzdMOlDtPK0RZ7Akfm5RbEv9
         tTQQHWgOtQ1Sg0IM13lSF7/Hv+sAh+PY6OaGwubExgRtWivhz8ElVb+WPhHfgeAVY5I2
         hfN1vsUMxel07YA7dywO9x0P/9ncsg9LU/xa9lUAP0iq3maRqKXRM5jFTlHW0PaHYVG2
         KZHieBp0xakBC60FAxnRLg+bo+qp3u8GTV3CYj8WidACUWGKU/64fzkIoQ8ibYF8bqUO
         SSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690091; x=1780294891;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH17n6noNfw3rfLs2gSqPuLuLSe8f67XaN2dj3fT22o=;
        b=NxmrTvJpp7WOOka/FaXCs2a1GY+A87k4W0m/r9jYly4vHxdrQAIyKz6SmCjJ/Q+ENC
         7N2wHH3KbOEeqwEezUYwWuoRHVz9lBCNwDq4a8RnyNfra3/LKY1uvetMNb40DdQinCH+
         SY5YCavQAutWabOKv7R/qUlTHFGXZyM/hEXRa+oIs4yM2LTkH/ihu8ieQhABOFmNEVCw
         /va3uFDhuJweg9Au63fyetsJI9bBwtUog67Dfa5hOFExKeruXS2FfJVgKSboFFWXH8bs
         KbPe99KC8vss7NxdHPF0nYFpStK3gWt9e/6/fwv5C0IZGsta3lw8ZNahwJ/9d28YElUd
         SJMw==
X-Forwarded-Encrypted: i=1; AFNElJ97AeI/izlD4PcbmGicyUQL88FDXA/YeHSVam2QmpnwcsFy5ieOrF9/DWczK6fn/lDKmDYmKw/H/qFg@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZ3wUr4wLnWvh+QSwM+OXQMjZ35bFF4MhHvJYD/RuspU8flnW
	3YxRqTj3ulwFj9YRiYCw+D0NL5auN7uaq+l4Tmw6V3flF9VKtkjDfLTz17JOEgO9M6qGmCvmDAE
	K5uvlaV1hiYd9wbiRsJudxVDpfY5+eqylAubJIy/iVbY+en4/8Q7YqwIMi6zjgsKR
X-Gm-Gg: Acq92OEknuobMLPavazlMsj4Ie0q7PCthLrnYOBPwDyQ2TQZ584b43WMzc2HzCpt+7s
	Q8re3pdkCA9I6nRPEkrPfVDzq4guCwDB5nfv5j57Sato1aSWEn23x5OqMrb8S8sDtDSCNp59ykh
	SKqism1/U4hxwOcIUYvprlytBbu3P6n74YF01Dt3idEACubqHWFHcPhycFr8OCn0LHs2OZw8Qd7
	CmhAYdVwg1yXaKHyMskmZ7sJBHULZLAnsFSdAr6RY7et0rEhzZGIPiEJAfiWqvKqdY/SEqIIZgV
	Gm72P3z6JhMnpcAgb67oOh0LPA79FBcVF8m+4tmEDZMnWhQW5DlMOOXxbw4kcF5ffBpYA/DCp08
	c7LOrjdLDuLJl7uvfRvye/Xkex9okk+CEPSW2P/PVr2waEEwfdUW4UYFw7Nc4tqpUIrb8Jou0SL
	FSs1PbTzQB4ztW6sRM3ht5AeRzYg==
X-Received: by 2002:a17:903:b0f:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2beb05e2c2amr156259675ad.23.1779690091186;
        Sun, 24 May 2026 23:21:31 -0700 (PDT)
X-Received: by 2002:a17:903:b0f:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2beb05e2c2amr156259465ad.23.1779690090719;
        Sun, 24 May 2026 23:21:30 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3cb3sm85722765ad.40.2026.05.24.23.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:21:30 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:21:17 +0800
Subject: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFzqE2oC/y2Nyw6CMBBFf4XM2iZtgUr5FcOijxnpgodTNCaEf
 7eKy5Occ+8OGTlhhr7agfGVclrmAupSQRjdfEeRYmHQUhvZKi3I5Y3XICzV3lhFHeoIxV4ZKb1
 /S7ehsHcZhWc3h/HbTyVD/ouMj2d52k77VMMyTWnrq7aVRjbRBOstUuiiNJ0jsk0MtVTGNu7qK
 CLCcBwfZdYpar4AAAA=
X-Change-ID: 20260512-fastrpc-9f3b691f8e2d
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690087; l=1059;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=SN+gsXJCUTYS3QP/s7Ozjn5Ljc3dX0Asz2QRaKXR+Iw=;
 b=h6LoIVHGzlEZvBo37CVuAx4E3Lvu+iQLPiIfx74gWWVlY60hZc1jGL0nnHP8TnhJrgfrKftqS
 6bKeXwBfygDAejjya+rECANlDVsihwIcYbVv15VNjpYkQQptoxX+4hf
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: ZFIl3JzZMTZGhqJ9zIiHy80OSfsHwwag
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a13ea6c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PmvgEI0Rx0sAJRWD59EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ZFIl3JzZMTZGhqJ9zIiHy80OSfsHwwag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MCBTYWx0ZWRfXy+jVhH51zJNi
 R7dwfmii7ZgBMbLnOi5DhGhhAqxDjZ2q9tAEL6fCxpnfwQF2P61x8qOMXtLELrv4fU5wjv0qhwM
 Bgd27VsLsqx9pUpAEi9vu2cHnGkd5FNHK5dHC874jerTk5cWZNQrHP5FKBaj7YlwvHWmwpCyOB7
 XdNQbN2HZP3BtwFB9w/dR7ClAc2ov3YFh5KI4/oM10Lvdh5mpHAG0pbIu3F4BrXSCU4reE7HLW6
 L5K8PKXAasasRwPd8CBpuHgOKYNYtJaBkx243Rtha6hj8TB8Xc0eTeT6pW2hrDlIZgJSzn5b3wm
 anQVllF2gdwJJNSFkWhcruqmRQtorA4NwH87KU13SgHgabREAsGzcnHlYjyC89QUgiyMYjnczGZ
 6KbMfy0xdTWch8XwlLJ4TEIf36jndZ8NSdyJ02mP+duw2Wrq1sNrMi8NfhCsBNqrMAVRgdmT9gx
 e6hd4XzuX5CXAsn6+sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250060

Document compatible string for the FastRPC interface on the Qualcomm Maili
SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
fallback to Kaanapali.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..afe52296bf1d 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,maili-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-fastrpc-9f3b691f8e2d

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

