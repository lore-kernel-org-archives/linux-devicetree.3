Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174218;
	b=IR2+r0pfSlnG6Oa6KMA0ILFyA+EYjXiArf22g0XBxHkc1j5ylRS329A+hwTsnqNsocxv
	 nDx1zpc72/57cMCtpvfWmV66K0SQYRwjqNvtHsaJEMKCHAlUJR58BMI+p+nbvD+VftCtL
	 tg8JgNhVcEHagSjwLV7b5mm3oTSIJ3xGB3TxOdK0W2HORm5kHpBnCsqmnG11WGDvVqxN3
	 NEZZy4eRYrMm14DE/ibQ0PjwEZh6GPfw/oKFmg6z6KE+t/u4OWoFmDeSTcL2IenAFmHuj
	 IXUfJ9lfb0fiU7PDmt4+F5F6FgTWSwLI4K9bXoqLqpExYyTo0vqQ6jRDx2sLD04LGLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uMHdIQH1RVqwJCLiuFphR37q9Xlf8zGCHKM0i5zGed0=;
	b=XmEP1JUihhoXhJXkCEIrGlmFh0B1nTkjZw+rTCWtW3sDgUGsGf3Dx7QRAdAq9+Gy39Tm
	 ueWpI92VLrAIZpQlaMIvOvtk+38ITGxBqPUT6f59R28orMuU3xJm9T7noDHcYN2XYBwZP
	 +oFZdQIVUBe0OSsos0sFqQrebq5wLlxgXZl92FhUDAtetK1GKmDUoTjq8d72qxkcxYqnl
	 CA4tdBkfq00O/Es8dtY1mp0+bz3hTxaxP3O0dZBidGBuDzPz0fxb/peqtmbV11EjDlOUm
	 HEWhBopd3Po8RTeWCmEUb3rp8UftL3fEM6XkTtiayEd7S45kIFjy4cUKAZtd84OCEuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yqm1bdhd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxOMiJ4j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988960A2609
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2988960A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yqm1bdhd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxOMiJ4j
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6iJ3987212
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uMHdIQH1RVqwJCLiuFphR3
	7q9Xlf8zGCHKM0i5zGed0=; b=Yqm1bdhdZvZkCa622KGaxaYhEJKt9KXlMwbrg1
	0zC4l64a14wpt6w9rXQEXvEx4+WdfXZpdkrN/IlpOK0UpDErrdbvPP/AcSB213eC
	0rJzc1Xo8bvLYuzqvr3leEQxs2GILSZlGqWJ7KwoJcsoSH8hZrWNb20s6QtgpyPj
	QrC9+zI7JWjsaRuuwwuT1oAArhoLYoWYBwgdYhhNYOSbt/0727MRYFM8hCm4lyuD
	hSbJVweixYzSICpnVO/ivQaRjdnaUOlnxOteJufa6awO4BKfyHnmvUhCTVzssEH8
	C+KM7pkmAHqm7Vqc6JQTklcU/czBUWNsyQOoAgABs8SQv6Ig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu816fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:30:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04561ee04so4513115ad.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795174217; x=1795779017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uMHdIQH1RVqwJCLiuFphR37q9Xlf8zGCHKM0i5zGed0=;
        b=bxOMiJ4jJMG1WrI3u6aoqzbT7seNGedwiR/uxEhywNWhTaYAQWFVGLjBCQKunjQ9sD
         Nf4y93SAQEk9/1OvAdxSXXT8IX7k0pMhpfnmWuavAYdYunKQG4rlZsDqea5tClMP3rQU
         7eRFzqQ+YfJGlDhLaAIuM+jr7UnYpI1e8nSE3NmsmrGaORfSNtzIg/3eLYj/uDzmRaEl
         nFbByTfy7LVf73Tm5RvCTEUlVlWTSAisfjI/rO9Ni09w4owngjxMSrpocPqd3+8khqdQ
         bMz+hl0wTewakQdTpoLFOutPLyrKQSZRDYlXoo8cCYGyg7zfQz1Z/MVgNv5IGqpXsq8O
         FgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174217; x=1795779017;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMHdIQH1RVqwJCLiuFphR37q9Xlf8zGCHKM0i5zGed0=;
        b=t0WPBtHaQ1Ra4NIZSoDfPr7Fb3UOXsjyc8B8/Zm76f6yeWo85u+UgDS9+tBF7p6DwI
         F9z8OlJb4wcFXybAcODyhmVHSQFVh4CzQfbcXTKQmMTnNAmAiM+ZiOWrpt+L1S82wSR1
         ptGyy0m80uiv9Aq+YEcSJJzdyyAwf+3oDEhQ0MHJwaSQEH2kAvrr6miST8j4UFW47tSW
         nzDl1137VylS+Pi/mQE9IcM7kEylCsO+bWRievOKSlSGj/dxQusgavqgOcNDJQr8rljj
         EexRHIPaH0nTtx0AYJtow2WL68IOrSGj7cRp0dVSPj4UXlV/Yp396YMbKBl2Mu5/YTAp
         Myhg==
X-Forwarded-Encrypted: i=1; AL+hErFlavsY+ej8RaPXk7/HIG6lAf/G4N1dDC8V8l6A5B/jk3QOYbCAPeCpf90AFXaBQGOjd7Vz2uw31WaA@vger.kernel.org
X-Gm-Message-State: APuU4Z9a7oDlPHBvpqYITdOpXWaXYvz5xEZkFdpeY4ufXfDM4UM/Z2qx
	wQ8ENLcnQIgDgI07yfuwd5qqFhdotPp5rgfSbmuOijyRg/xy5bf2Via7yYNwm++ON9jGSNkF83n
	wz71IWwNqHO2+8+aSut47jbgt7ag7KTBzBGTVTleAi2J9B76OvTd/KjDsca8URtio
X-Gm-Gg: AZFdTZfGjqixJq+yp5Ptr5BfmfOADmmXATFW5IYSw4cyP5AjopVwXuzgXQCdcWXggUy
	RTXaeNjZaKn12YQkmlGSFRalLtR4R+WuEmTy8jDDaKaKqJiYeCsD+W51HBHmM6WeyMfaVEBq5/D
	CxZETh40ACzEdT+40kgqgyfWMOh/s80QZ3KZXQe1XH8WrX0XJ8MWhh2lBjl0hFf7UJS6eq+7My/
	Njb4L0uky+R2rF/i3SxxmpmDKiWNr3XFnUW/bVx/HgfZOc4lGg6m0oOVeckeAWTpHd+PPxNI6oS
	Y52X9yPl3xVJZ80mew4JXZCCmwhV6eEF2jywInVDSiWQHg2QaR3eNZ4PINPdkT5yZLfEXnQ5vbG
	AXrwewaLgvSQakN8HNFM15fFpiNtNZeG9xUprovnFVgd+XYIMbWVnMZiwtJW71r9zjGKssr7Il6
	4FyY092Pw=
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr28437665ad.18.1795174216628;
        Fri, 20 Nov 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr28437285ad.18.1795174216130;
        Fri, 20 Nov 2026 03:30:16 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm2751245ad.19.2026.11.20.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:30:15 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Shikra: Fix qce configuration
Date: Fri, 20 Nov 2026 16:59:51 +0530
Message-Id: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8vAGsC/3XOSw6CMBAG4KuYri1pS3m58h7GkFIGqQpIC0RDu
 LsDLjRBkmaSv535piNxYA04ctiNxMJgnGlqDHK/I7pU9QWoyTETwUTIGQupK83NqrTVkBbmSUX
 EssgPZJSonODQwwJeL+Dp/Mmuz66gu1mZO0rjusa+lo0Dn/s28YFTRmOlA5nHHPJMHhvnvLZXd
 91UlYeFzDsG8VU4FytFoCI04JPWeIoNxf9V1n/xUUkU+FxGDAoZ/1GmaXoDi8qIRlEBAAA=
X-Change-ID: 20261006-shikra_qce_fix-270b735479ad
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX3LxEv+4cYUQA
 jb1bWFXvl6Tt87hUE8SYghLjKYzCm5KasGvfBYdHe7djnU7qQXuVCuBtoI2JmnHxhugyPZzUhak
 sS0iU9RkLJOdPpahswpME3mNuRXGW/EibLT4G5Iwjg0FRX3fdryMA7yV22hMofepoSZlbT+BwJE
 XkCb4aEghAj5oda9XUXg2rfMl1tASYretSc0NuTStiYiPZrL2WjJLsYiYoUSTn910RZaR0oQ3bS
 HYU74X7CblymsV3iThLxPIN/eUUaZXT+z0h8JYpRR5M6fLnewfDbOuJu9s15li0fTmT5saAKho3
 SQvw1dgwrcaMHMiJWM38ZRhBP7qEVYLTjoQ1DpxvdQePjMVLJaQvl+Le26dprKVGONPUu6o1Sqw
 sAuDQ+TPFOtPqutkfUk6fLnjbfrzrmoMet8Seadgo1NUEhZxa7YI0aigUqF7jSj21FNEygt8M6N
 GQnh8D2uffxDbS4KxAw==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b002f49 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=FNyBlpCuAAAA:8
 a=J1Y8HTJGAAAA:8 a=2l3kZstW3bczaa83jWEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=RlW-AWeGUCXs_Nkyno-6:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-ORIG-GUID: kVBLl476CyYn_vR576qYnvncMQkTErl2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX8tofokMPs1jY
 GWV2ZMUQvj1zPHVZuJbTugh0Y0flIHSSAQfmV+3jPjRMk1LJjhNOWQt25IkN5/7RV88yv2/iQkA
 VVjqk9XY5Gq0+LfJiB9ZvmED7RlOQuU=
X-Proofpoint-GUID: kVBLl476CyYn_vR576qYnvncMQkTErl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200045

Herbert/Bjorn,
This patch series fixes QCE on Shikra and targetted for v7.4.
Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
backward compatibility.
This series updates shikra fallback compatible and hence, both patches
should go from same tree to pass make dtbs_check otherwise patches from
individual tree will break dtbs_check checker. If dtbs_checker is not
blocker, then patches can go from individual tree.

Bjorn, will you be able to pick both?

The patch series fix description as follows:
Shikra require explicit clock which is omitted with current binding
description.
Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.

Validations:
- Qce probe and kcapi_convenience.sh tests.
- Correct clk_summary output as prepare_count and enable_count are 0.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v4:
- Rebase on next-20261119
- QCE should explicit vote for interconnect as consumer.
- Link to v3: https://patch.msgid.link/20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com

Changes in v3:
- Collect Krzysztof R-b on patch 1/2.
- Update patch 2/2 commit message.
- Specify merge dependency in cover letter.
- Link to v2: https://patch.msgid.link/20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com

Changes in v2:
- Update commit message on Konrad and Krzysztof comments.
- Link to v1: https://patch.msgid.link/20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com

To: Bartosz Golaszewski <brgl@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Kuldeep Singh (2):
      dt-bindings: crypto: Correct Shikra QCE compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261006-shikra_qce_fix-270b735479ad

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

