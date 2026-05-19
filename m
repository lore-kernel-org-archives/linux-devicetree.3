Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B793B9608
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221030; cv=none; b=mut9iNBKFa0vvq/alB/T3qS3wur3aBJU/wCsZPaTJ6Xh43//M7UPYhcrYQpj2Je7Q8fwIFcTE3QsGo/bWlM1XAU+J1jaEf7zrHZXEJuI3a+17m27EN3dWXD9pIHnM+xcwJVCV4UvDP1tG1nnmERjWQZGhNvts7tvp3quHKr1IlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221030; c=relaxed/simple;
	bh=/w7XGxfhaDe7QdBC9q3KobdbqwqXL4pZ1Apbhmx6eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OCJ249t8JTGcKEAj14YyjF2DsMoWPOkO2jJVzIwNHpLmFMWemX4f6YKWOAmI+sxwRSmDXd6g3ZMjmcjAsDToXag85BblI/dFFfMl81OX4INBIE2l0KC5cE5POvHt7IMZrjsjn6U/pbD9eObHgh0UUtriOqGjyPx2FKpLQOSqrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEPBzrTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVq7gDb/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEPBzrTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVq7gDb/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx98Q1953955
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zv/6eViwK5rxMf4H+Q6UCmCmXc+mrouaTyBpgAVHcUQ=; b=AEPBzrTsi/LbH95F
	Jhxw8OflgsXakY9ZHVVuo8ZfI4FCZOxS+7jIEdhKcNwGwC03VxdLgopM6ut1qxMr
	6O3Ji08XBSk5aoITqDl8uCP9TsSvU5OekYb570Gk210kfVuezqu7C/nQFbF/c7R5
	FJTSjs9PypdjmcM+FFpNWdHPakrudsMskXM7t5tngAhYHHHI2JSidendTIhAylQw
	J9ZZxVn/g0wXodPgqSOtGG4i8a15I2TJTXTY+Bh/jOrVcutN/JPBacGqzeAyZVxQ
	DBjtZNREW0ZLfH6yH2wE+rQq9DmMbQR6Dvf7YgGqw+axSsCqtWjxfP0SgZx5HJwU
	g68KXA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xs96c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-639389de134so2256820137.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221027; x=1779825827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv/6eViwK5rxMf4H+Q6UCmCmXc+mrouaTyBpgAVHcUQ=;
        b=cVq7gDb/8CfU/n8b6Xz4gvs/3KKPzFQaVfUNvWeZz/RYdvPy32shX5Ng+/ktiUhzoW
         gBOrNDFQhOLQrCJKtNpCN/3idN7voVeltvaZao5a7L+6lkLoLWBGeo2TG5LmGF5yNYcm
         bUypn73ZJQfJUl2XOt0ZKLn6FRfnEidXDQl5G5WfRoQeTtdhJL0B46rISuwxhkqtfFbE
         aOcD8FdFe1GFmcQOY3vgqW/rT+7WcUIVdERhcWI/Q9xNJsr4uRd48NE8z/J+XE597XAn
         DeWX3pUAdEXfnACk94NSiyxjXxJOcV8WKt01TAoltyCYL9mQ6GlHXZdNbWZvt1WYS2M7
         JwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221027; x=1779825827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zv/6eViwK5rxMf4H+Q6UCmCmXc+mrouaTyBpgAVHcUQ=;
        b=n05t3BYkAoeR/gAHPiCHMW7lVx4SZpvn6sBoiv/JttssKXkL1iXqHJRiK6pSc0DtMy
         uP+9lwFqJSTJ2NenViW4E5Lc3XnLBDxtR9Nnn11TUNvw8cc49YiJ5Y66UNsbSrYVkNeK
         m3u02a87YfWzdUbBW8O7RDlwUgLaMR3KHRT8ZgqpRGtm1SxjeIO+SKEz8Esm6A8FitIf
         xzuT96HLoydgQX6WEmbiqOadB/7t+sGuS2L0mkiG4Sr2IwPK86tW7yGwa9bxLjawKAr2
         Mb4Dbop6d3l+mwkz0oZu4g4LOYIlaFgVP6K9k07Pma3mLeUcGMpwYOri6HVYMhD5K6KV
         u/5w==
X-Forwarded-Encrypted: i=1; AFNElJ+n/0G14HRS69FvnXTverwRpH5bnTIaiJm+ktX/MSRBIxRlKURxEvtaSgS8txfZHZHbrfxN+59s6nnl@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3TXS3iBEKsw/yfru47D1bB1y0/J6bm/ouX4Rdiqj4jFuzwM/
	Z1IAyUrTmh9y3j140D6oQuNi16sdCJpb+5lReZASgdw5VBKUCxc3s/tCByhrFOmuDOkpC+HUGX9
	mvbMtO9OtqQYYF0eMfvsmEPV/sZWW2un3lX1U2AUuLC4H1p803NAA3mNhaQ7ozHSS
X-Gm-Gg: Acq92OEh38X0KAA4Jp/O4htCtlh8aUcD9vlaIYiyd21IY30NQuVzfj2nT8n+EAF7RpB
	1UrFbbxwsX3dwUhpufXdogqvSD46X+gpC8IAPQJcFylKRTahDX37EZglsIJDI12JMRADCLB0DYs
	NAMX7AN1dzpqO0jcoLAPSWYrxnTM6jRWy68nifpDDKjamRcWHh2HKylTDuVOxmfD3mhIfY8+1rw
	Dx00wMcnvIoSbNfRKtCNG0mCv+42gfTbWxSCvV/A0SQOMIG9VTzq5lkUnrJTCayp0fd31qze7G4
	tVZDgsxqq/xp5tEg51wha2N3VuowFyQhGXK43CaUFztQ4zzeaJD7WbdjoEvTxBIsj/WDF9hnF1l
	LrMgRKWFFkuEdwvuc0MhOLDrHbzKvFhl/G5bBY2bORgTuuefDpICsZKM=
X-Received: by 2002:a05:6102:8659:20b0:660:d26b:506b with SMTP id ada2fe7eead31-660d26b7500mr2859340137.5.1779221027179;
        Tue, 19 May 2026 13:03:47 -0700 (PDT)
X-Received: by 2002:a05:6102:8659:20b0:660:d26b:506b with SMTP id ada2fe7eead31-660d26b7500mr2859299137.5.1779221026609;
        Tue, 19 May 2026 13:03:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe794e7sm112085175e9.30.2026.05.19.13.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:03:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:03:18 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali
 and others in SoC names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-dt-bindings-qcom-soc-naming-v1-1-005d29d261ae@oss.qualcomm.com>
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w7XGxfhaDe7QdBC9q3KobdbqwqXL4pZ1Apbhmx6eUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDMIa1Ztfuwc3MfEcKPxWoX5x67z6cz2XJUQzm
 H61yWM+/VmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagzCGgAKCRDBN2bmhouD
 17E4D/4jtPFRmEpgnP2wSJBR+MQoqImQalD8zkBV+w87ilCBSzmVNqI1nqZVlXvdE2PZpTJCAkE
 NmwGpZcJiF1s9s08YfGOqAqwF+QflitA5zbmRl0watGkUyfDapsnk5p3xFHS47mDcqQCv+8pY5T
 EXtvd8hv+sw8+E8sniUwPWBvqCc0Tuc5pWjomRaZW06iaWa3qDUZhnCZatGhsvCEwXw6FNdvkyh
 vqym6UYAaVGYzpaKg19M1biZSjjBunzFePSujKrjPHNO640f391h0KHpnNKJeXe9OkQj7xN44JI
 7Q3LGSu9miBpoYwlLD5Kxny0GeT4Oyx4M0RzUv3XFsau0H0/IsG91/Ap0vi8B07WEs0XqModdpG
 5BUhuACmJLIhUGSgsSW/w+AoUUrz7baRfhDOXPFZNp33IeqG8sho2Snlw90ra6dB0jZFXIESqCz
 CTGQZxgfqjaIejKwJlwbUFj91R8q9gGUNSWgmX4FRwTGmBeb0NXjo2+G4LhCxq7ji4OL0IBzaLX
 RL9zriaYSyVmUEmjrbrqsd9NlD3nF4gzaq0qRMP7lEOojSYLw20p9PfXjcet+zpJFBhcv7e5mz4
 3BRbk3u/VtscQRRWkwEFl35VlzEbTfV+h/xc0ysrM/oXttQfY+Kd4DdJACpD8p0/PcDnv8gl3pV
 NP/UQTuTaMCLHzg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0cc224 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=872ObbKbCC1Zr02HKR4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 9srP6awnw6-RJKn4AbhZE_2yeiomfz1D
X-Proofpoint-ORIG-GUID: 9srP6awnw6-RJKn4AbhZE_2yeiomfz1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMCBTYWx0ZWRfX60H1MZ7StpUT
 7w5i177HsM8XAorwuBaB3GCqhoqCUDl3kNxTIyed6QZn1z3ylfA/xSRVW6hfYNx3yFoe1Fn9H2v
 Kr1p349TxVIxti2WjD/kfQzgrQqb5gKDDwfZYt6G3urekZY7fpAURYkODUBbeC+NLBm/Q2dngRO
 zn0sn07nQyzglJ4LHRj1M3oQ41nU3RW644qTVm0RafheYe8Qiss1wiNQrsJDQCvspa4NVRBtwB3
 uwSUZ7KIxWXY1ZBqhM8P3JMsgwuaFtViTegdotOsuCFrrPt9BWrf6m3au7Oc0jeefe4TeWqD9rm
 M5+5kRQq76hbC3Rt8X5GP5HHPxuM0oQOnBJkGfPBvUUaY41WJQhqNQ1JeK1mpahMRiINqMgMxfL
 p9Yk6Yb+6stYvu+4SKQy6G7GI7nu13hHXQhmO5D8OFHjW6OvuyR4aS4QfE34mYh2EMww3vDLhKu
 dV1CAJhLrEZJPxOeB6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190200

Grow the schema checking for proper SoC compatible naming style with
recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua and
Shikra.

Since switching from model numbers to codenames, this list with explicit
codenames will have to grow and list them all in order for the schema to
work.  It feels like a churn, but the compatible naming is still mess,
for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
style (qcom,glymur-pcie).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 27261039d56f..b5f3a750cce8 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -25,7 +25,7 @@ select:
     compatible:
       oneOf:
         - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(glymur|milos).*$"
+        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|milos|shikra).*$"
   required:
     - compatible
 
@@ -36,7 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(glymur|milos)-.*$"
+      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|milos|shikra)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.51.0

