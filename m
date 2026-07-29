Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5A34DCE0
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292526; cv=none; b=eQcukj18s4j9N5ZxNeat86Hwtf8pqtcWfzYQmNgfSPSHQiLWUtmMVLplb+Wnjk0hrkRYl2NBaMjSOqhlRIh/PUDPTippY2CZqBgMdn/2ibjuVLioIIcAyS87U/ch5b9g4LeblUSeVu4izc2Blt2Eze7Z4ZlXujs47F0YDUlJPNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292526; c=relaxed/simple;
	bh=0nNf7hD7ukvCS6YHx2HZxlJdOJMn6TNLoM7PLeT/zSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oE90iSfucFBtoKxtu2sgBKDErW/vFYRH+fXLp3Q5i0WUZO9cZ5DCk9wWHry1ZZyARZG5b+MOj8+w/9dhwF6jXtSDpm5jXw+t+YrZDHd5xQjpGpuF+b1mML11+0TEVbFWGGgAGCX3OfNuFzwVm+lxICPyX/9jQPYC+D/2QhCOdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYgmJRC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyzkMtkl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYgmJRC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyzkMtkl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1H1Ep234945
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G2NjSTd4divZ6uJ4pY0wPN3fFU6UA3ky1PA
	YtUtTjPo=; b=hYgmJRC+HZSKUAp5pjzct8TOlBof8q9PtDqEQwjbGH30wUIVpNj
	IpR+Kh94o9t0pOiK+MnmQiIPX/UUk1qRzDq5542W1sPc68lBIHG7hetlcqf5yLyc
	48JbjaU99IT6n/VSQhx9gtqYtwJDKuqLF0xBki+T4j5IDwv/niwHg8HWK/R15ln1
	ih+EQLjnCE7udsVypcBLHvdg8R87+Jn8+f+CtE9X/NzxDO+RleqcgNTI2x8a9yVm
	0zyCOETmJT1yPkJOG9d2LPEDqTTQRA/Ns8mUERYYW+bBSdYJcNN5N2y+wGouhE2p
	SDhGR3f3dHmIdhmTrkSGLTFGw7FN9Wvpbiw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sagjfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:35:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7621655eso819525a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292524; x=1785897324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2NjSTd4divZ6uJ4pY0wPN3fFU6UA3ky1PAYtUtTjPo=;
        b=HyzkMtklKq43iHK0T/goky//5UGQy4F6C1JrZpc45tH94WlT3CHXYwJn0h7iPVoFO8
         UyiMQhZq2e3HFirM55HXhRD6w/WXCAOeEUaBRh0JD26XPFktNi8RtD3fQxX6oAkFaCEX
         9EBy3GhBawuuEoo5GX+uujqtTFwKYbQs9ngnqO2zTkkYDJCAaFxWWqjW63T5gE1SM4/l
         XR3jY4LRWUzyw3TmFmh9A9ulZz7tVC9GcxSjakjIEEE5XdRRgTADwSsMnRV7h7gDY1Cy
         S3O3rrs30V37fBQzoVt0Qh3ZeQjewNR1cNUfmoRY/YOlIIMBzj4qjTRaDiWu8bNaIoEt
         3jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292524; x=1785897324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2NjSTd4divZ6uJ4pY0wPN3fFU6UA3ky1PAYtUtTjPo=;
        b=nq2V8iwkFtP195naxV6ty0i/6eAfrCa68ys+FUscg9LS86TpX36PcCd6sxX8scmYHP
         fC/+0YqnoIu7Ahsgc8axs3olSyX/oEftDIH/j6RZtspCKEwyl7nB/M1JkviiA+PcQZ3I
         LAGk6VH8ht9o04EhXsD8Ds0jexnjRmk5xbRzc6lnjbL9oZKtb/C0NTcF6Vxw80lX4+is
         GumAsJ5DFR+SiIHnOsk+xrc7GO++YXqTb5sN7dQEN38KZf4nh46khn2B5Nwvmv3WZPnO
         55l+il9NaCEYQBH+grTYmwtvtrg1uSo4yW6ejzmSoWAU5+DOZ7ECOXuUjrvc8ZhzrbI+
         4b1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro2a/BGG47aT4JTGKh4VJD0uid407/lel8Dei82UARS2fBmz8c1a8yBvlGXZyeEF39cApD27Tdxg9/7@vger.kernel.org
X-Gm-Message-State: AOJu0YxBRVBxUrGnViJILf/HzbTU9v1sCz+4+S5zjroqbcIgJopI6dIz
	/YNPCM4osyU9lO4QO0k78NMZd+YadcTfJhbXSHsYsjT1lIuk5hOoxGdNJmGRlW+16F5fYQ5b9o0
	2GivfdPIv5lJqkdBdyD3lYMIUGlvVGBKES3OMwQQgpnJ+qpdK4nIa1zmFgxOdzGZI
X-Gm-Gg: AR+sD13XeFnVEg6lf/xSOuU1iTBKi15NoSSmI3ZXofJhv3UMIMYiHc+E7L1Zxwa8pFF
	59gb11YYjSRvPCJ6oVfzftLuElelwpe21g4/kaKe0mTerhJNtkuJ8F2ibUhFXVwmoCJRjUaprmu
	jXPSMM0GlxdXU4g9tA6Iq4ycBStXM8L5hOjUAp9kaCaqcmvE9LYOm7IC/Q30DbEpfPm2DKNqHxy
	KZm49txYx0iETckAYmMJsA1HmwKg+6UWSQlc2Vy4J0bVE8PpzUvt3pwmSjbKgb4yDloVwuRufpP
	MJOypG/Bpj5IDdTZlGpERLBNzEMDIQ/h6WfK6DufXlrbPgraYiK9GANWIx5IkbVqwWLpK7+B+tr
	N9wK5+ZWzHzdahf+TXDDT15cNopCbvjawWd5IgHRfyFwT6JJH6zIL3rhCGSWu
X-Received: by 2002:a05:6a21:6196:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3c8ba478a1cmr5970557637.30.1785292524091;
        Tue, 28 Jul 2026 19:35:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6196:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3c8ba478a1cmr5970537637.30.1785292523655;
        Tue, 28 Jul 2026 19:35:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm3899837c88.8.2026.07.28.19.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:35:23 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Add ADSP and CDSP support for Nord SoC
Date: Wed, 29 Jul 2026 10:35:05 +0800
Message-ID: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jJ9e4W_nrYGCbEmNh36iouR8to0_Vwvv
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a6966ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jJ9e4W_nrYGCbEmNh36iouR8to0_Vwvv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX0TA9Ebaj8qh4
 VjFAYYTWHDIlAmh/f/wmLM7GsoxKLa0IDcTYDVRQYHrzV2MMqHAuThnFwKQChCxlRq/zWrz+DnD
 CP85mYIdMyd0yFKOnkp16CXsV5MgcGc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX4anroQuujvel
 RqRSRoBjZaGWuWjtvH1aWOxrVInFYGIj7CpZ3SZSno4h3tLNPAChvm0rKrsE5BatVyc7DtPhB/g
 znwsyIsP6d1OPFSoLFZX+16xP5QtgzcD6yiqiDQft+ceYMwfr1Lzh6D2Nx4+qDr3+tzeXApwAIw
 Ct8ahvPb0OWyDZBcM0cPy/WPgJCp/rPjyAWD9R7Pp/JTq49e0UbtzTx0ORup64coeRIIPGLFInP
 hxcoKefaYLQqG0HS9+jaI9l6ODgRfEYGAfm9IAY/wDXgwssb/oH1oM6Dd54TODqPIHUz4MhaZuP
 vdvcYkd3pz61UqnPP4efnEuYu+ZFTbiUPRtSYxqYXfHnK26GArfFcHCEhJKDrTWhHIAiW7JAl9x
 2D7bweXSi+i7blXAZ8gLJWqRniqAlDYJsulawKfN8CtQHKfT1EpXOoVM04ZmzIfkXB9rAkchZHT
 QZ3Epjg9vdKLEAVMQ1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290018

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually has 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v5:
- Use .mbn instead of .mdt for qcom_pas_data.firmware_name
- Link to v4: https://lore.kernel.org/all/20260728084012.685036-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Add Nord PAS entries to qcom_pas_of_match[] in alphabetical order
- Link to v3: https://lore.kernel.org/all/20260727074621.561661-1-shengchao.guo@oss.qualcomm.com/

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

