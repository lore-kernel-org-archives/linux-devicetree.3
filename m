Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29693803C8
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783483140; cv=none; b=TPJTm3Nogcu6Ei1el30I7au5RR8lOMy1zV9RWrx2WysnAMIaBdJIirMOvpvEvra+dB8NuzDD4de4acADO/gXw8Nw0Fngp3LSuZBz7qB1QMO2Hm5Jf/NkpTQy8hb9OXrjCUvuGw5Paq0ByCd9dK6JAhrq0OO6VVLS/BlOdh1Lycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783483140; c=relaxed/simple;
	bh=jcBb2YDdqWv1otYxbn2Wff3itz+faGuhvh2N5yqzuIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TD/kX/foUV76SGQhTJwjxvrrGaq1D9OYG/ZJKGpG1DszX4HGt8AMA2sp7XXV3PNDeEXJ29XIPdBnYdv2QLWdx1OBVBEVMD+EhlUjJ3XvBj2vVnzyqB6igCkIddt/o333SeTQFFISQEwUe5q5RcsOTzylH5zg8iMPhhHLs5RTwuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SV+dAP+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F36H3sPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SV+dAP+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F36H3sPr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Md5ns974364
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 03:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6d3uAJoinnsOl1/YcHCszQu6juG1psUOCiIWOtRi+w=; b=SV+dAP+hn2aK7wMI
	L6R38/BT4XrdocIMc39s1kXh6whQzQmOF/YuxxOVmFlwq87AVizRD/3XZE93pZc8
	PcwI34dSCReN+OG2KG3vp/BGzXD7HexD+3kqqnOQax2LzI+9AGr7JJXN9QRlie+h
	NM1fl2maAl0KomVHdzdIuSWYmLMfxQbU29/b4pjHiBiffM8yMLa6dH/kIrIxx95w
	2F5eXq0y65DBABdYoQePssIyTeH+eQncC6XZuIs3jdZ4EsTjWeA+ndwdqmQ+mUHk
	uczvvFIs0+TwgTqcvU633oE+Xg+YW1Ryd4jpYbJAdlHbrN05X0TSWx/l5+oBtVI5
	3eOlRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tfyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:58:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b314193so6617705ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783483136; x=1784087936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6d3uAJoinnsOl1/YcHCszQu6juG1psUOCiIWOtRi+w=;
        b=F36H3sPrPu4Xdij9Nt7Cr6Oy1E+XR6aZzMc+oFMVqYtuNXXECpGmMrfm1XBiJvkk8O
         iYNOAxZJefG2YjTEDk8D+CEj7xWYDu9uUfGhNLG3Pkvp9/6wGxvgGPaiQCBwudaNhy8O
         Lq6g1iBf5IVgO1lPHFuK4iO8zVYsQFe16Lg0jjN3C8B0CM3mZEK5XLMfoV0UvWiG3A+Y
         gO9sZgMMYxSp2T1edH6FhtVbzGHrj8+ENbDTIEJG1wiyfV+KrCb/1znu+3gP3BuljbjI
         nWim97tAVVtgsNoH4zAEIWaVAaVjZs2zPom8CItwFEMMErwZwlMZai4b1tIT7h8UOjBD
         OHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783483136; x=1784087936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6d3uAJoinnsOl1/YcHCszQu6juG1psUOCiIWOtRi+w=;
        b=CGIeH2sVa6sgKVoOxiFI/pwPK0F3cu6O2FS1uIYU3Kg3moTunua/qSaEz8d/6RzH7O
         Yt5/xXyld0RMUEHH1vSbG39jjIa6UqsYiyu5mFGdk1g0SvC9Rktfh64TEX7HYdB3QWBx
         R1qdFaARBypO4rTjAAMkcw4IuSO9nvrcaYgOQ/D6AKaUJwIHet/x9iSUk11v5aCT9EaW
         b+V1TIm5XrFDIfp+Xbu77P7Tmn/rVaG+kW4Cua+YXHylwqEhXQskyFL9J/VKkamdQBBl
         nlRfyOdoP4hsJT1Eb2gzQ2g1mZwV5RCDCcghVYJ9075YNBcfPmp30AGxxJ2qnsNtLzoi
         2QGw==
X-Forwarded-Encrypted: i=1; AHgh+Rrq7Ik8ZcIA3lUEHHBXHx2uWM3veCEtvuK7E/WNADcTqpAtJPQlZyaJfKThQ3b7MThJp906dMNPd9Cd@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTaOiKG/fGVJCbQQ96HxxtUr7t5dZPeVeHu8XAw/knj/3Lych
	3mXAW3nNZGvYYT7CVc0L1x6xqcvkaIIbPMOblVJk/fovRs5WYukMKAJzLafaIPQQAQNKIBJAkoL
	3Qp1OOoLVWOaFHRsuwAjfGQVpmMrwcydC6g5wSws9wJX0H/pgNmPFIPa1F5oyV4Dy
X-Gm-Gg: AfdE7clzlPDLwepYt8p3C6olT+SgPQfDoBP/BIKo+DnpWT7l/IDSgIy/Pr4f417bmDo
	Xp/yUFkelSXGlgENtq1H9X5NtDJkdgFOMq/ydNlRZP5RJoIJRcM+lygtYMBW+Vr7lyEFSJNpjTz
	lvl4MN4PmnHc5soCnYdsyX2Ek9hJ9TSimGJeL55LxzJL+kjmh5HTE5NsLhO4BFo9jRM0294Ux5D
	aghmfwBuTN5wsxi52Ez513vyfvxssqoUt7/wJS6fDzW2F9z6TrRKt1ozkAqyBi09C8PbWv24q0o
	3aHILHn1VOsWPtZznvkusPov/j9NCK31MYt36ThfUrK4Nkw71WPvGwaAbJvtHOTs74HJt6412+e
	8hYOhGvSv0jw3WIz9JSH/vX8VldqJH2U6vPL52h19yJKk
X-Received: by 2002:a05:6a21:4cc3:b0:3bf:a4c9:b054 with SMTP id adf61e73a8af0-3c0bd0fa859mr692009637.46.1783483135737;
        Tue, 07 Jul 2026 20:58:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc3:b0:3bf:a4c9:b054 with SMTP id adf61e73a8af0-3c0bd0fa859mr691965637.46.1783483135199;
        Tue, 07 Jul 2026 20:58:55 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm14487136eec.3.2026.07.07.20.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:58:54 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 09:28:32 +0530
Subject: [PATCH v2 1/2] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dup-sessions-v2-1-da40f9c98a2b@oss.qualcomm.com>
References: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
In-Reply-To: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783483125; l=1078;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=jcBb2YDdqWv1otYxbn2Wff3itz+faGuhvh2N5yqzuIU=;
 b=NIU9Cph1kKEnebQNUvIuVcLjJmn8FM9KtYiCPWPf/yp1KGdMqb56gZbT4t3595WnzcHUhPLvh
 TAy6/+eaEwQCiFJLNN+7WLoMz8kDrC7rSQpFMEh2TiDFu/5se8tdG/u
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: MHJA5LGiwzBmsfk8qhiLCsb_CHUZSLCS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX8zlsxNImFp0f
 4OeQ9hIPaVmpWDIElPo+n5lUwbLwSdgSgFNqcMoRRvnko+BjZM4x5hffYxblSpSMzyi1kxBnpGn
 EBXshwUsHWqqI6ggYubP5zf5h30Pnks=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4dcb00 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vVYqS5fJ2MeE6r2tohgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: MHJA5LGiwzBmsfk8qhiLCsb_CHUZSLCS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfXzE3zfriMOX6n
 mAOXSm79Xr5PC1Uge2W6nyWudu3CnMs5r5JHH8XhvhGh2wr5xGUMzj1XydfhBgGxnd4OPjrcpnt
 8UZC3kynyoSNnxPiC+AnWtFJO0YWt3fIVudFk8bpqNt7CX+SOFyDjnz9nLLimhcMIwZbRNAvNK6
 L8fRXPEM4HTFDPJqajBhc5Hr0KpUFdsz7jYFRT/pzDnNDFwvatb14n2bG0wlEVnxKgLnrJtXu48
 oXw3RGrlSq7eUk0kKKHSIqCUJvDRc0jpKxNyex95QPWhs0EOIFaxQgtGiCqM1ahxkZI0Ci0e3gJ
 P4RG/IC5UIvZb8mnGRy2TPIANp//LiBvLuN7DRVrjpAyEqsMGn/IgV/WHkujpiK+2yrzKbXuPN0
 +C2FvhFzMjV30t/XHrHe8/dFDm+fgFQJNPFGgvlLCgtoQ19bPTNBmh0msl0U5t4OGI9AbxUUFPU
 xJ5rEr1ykp4KFIX45SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080035

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank probing. Session duplication is now handled
at the driver level, making this DT property redundant. Mark it
deprecated.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index ca830dd06de2..683989c468cf 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -96,8 +96,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

