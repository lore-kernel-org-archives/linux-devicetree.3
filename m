Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628249;
	b=tHOCh7yqJkQSJKFVTGI1UFVi9nrHV8NC2sufDckJqfD0tFa7z22u7+QNYjTGz5lN3mKI
	 /fmHg5qwNCHKo+qxAQD1Pkm5cljTKFNgVMVvKaQhh9H1ojczDaIcaa5sVdxKplXMJXhaH
	 Zy4ZWiHkcEhGJ3m4408m5yyLEs0+UMGQXeWPWJgtH/COpV5aNCQPmScBS/coEcpp0kJUR
	 X1fN2rts1bWsIlH/s3UhSN2bd/iCQqLZoTsH+rGkgvAzrFijXwYgMoz39vWZGgQZgbzcG
	 ugkoYDKnoNt8eG8joJWxDHYf09oJF18aBZafUQowu/NDYNQeA2kx0Yu1TFkpF5GY7CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
	b=igG1uMv0caOowKZ5861MCrqeZFt6uXPJNCM5CQaOehPJiYyvmO8CK9n/7S1+kaQVfS61
	 2kA6Lura1cSqaqr/cFbvv7CKljCSG6ZeyUhRpD8So2yH5CfYG1P/31lO/wKngydydlPZF
	 D6Xc45XHkkfx5Lin0IAp3cFicUuuDAmrVB/Ba+1GGPJ1N4K0CTy8qDefHgSWGTVHNOHoz
	 ycmA8D+M3H27JjaPXafYVZUoi0CKG35oKzKwZHCGFqKIRWG4LSNtGmtVAQfThx8UOdkK0
	 RxsSxSZdecffe9h9b8WhPGktoAnBsybuZjvbCNvBBWR2KX8w9AOjZ0t0v4dRRIcRwPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrXfdHH8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ML33df1E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449A606A32E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2449A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrXfdHH8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ML33df1E
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpB563512196
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 14:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kj8Fda6uHscKvI7NgiMuoD
	qrKd7/WCO1xgYEpbK+uUM=; b=ZrXfdHH8+h939oqNvWMMRuf2TVYcTjeQJ6dsxy
	Q+phgL939WRtYs3GUxzjgdRoK5qwcKgCGj7zjFd75L+8EIy1t9ZtVcNTOwA8OPuS
	eV6htRKbdPeZQ+bLsUdsgbxAYCh4rR45nTWNxutmtvAHR9Zmhw8FdxUK/5/QKdiy
	AzW6vWbE2JeERHRsOEP5Fd92d3K0VydUkz2K/xrciWUK+PzAmZkGw4x52UDAbH2i
	xhljz4O1f0bMLD9rLmwlsNmlIDrcondlUWIB/e3ZVkKzdVNB5lmAzlHYbg99xvCV
	zuYW6ckTzYgFjJR4Vt2cNT/eFPF1KttOSFFGoE2mH41RaWvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh559-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:04:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89ff475a0deso2748130b3a.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628247; x=1794233047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
        b=ML33df1EAtM/4gakNWiF9tXCLNdHsKpHs/bnsVI8KA/3ZlCi40jjNv5dg0hKUgVRes
         trDX/9JjfPAaQxEuPHyUR/U7+8xDjRK/GGh7rKvfguFEOg5vOw78AlO1/4n7G1UZqYvv
         HTQDGecjrS98WIBRb/3gdX+C8+X4ilfVa7EBN1v/8LMvpTl6x/mRRBlk1VJe3xusb4FS
         n+G/9c6M5FaorFl5tbaXLRfF+RcYXk3FXYs2/JjmJ+j0ABtFZPFxMwCTEnKkbi0RKyFm
         MddqDONEdxE8hoCIx9QxC1SeOG/6PVlNl8S3GzeQ+KgbqRBnO3DsN0dnhHJilClryeeR
         q6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628247; x=1794233047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kj8Fda6uHscKvI7NgiMuoDqrKd7/WCO1xgYEpbK+uUM=;
        b=XUkY04rptSNFwpzrz356P0KqZXegMegPsyiVwA4GBdpniM7XP3aU9rKei0trHHpezU
         mbSfuuT3DRVOwhlc5067RwIzUBmH3rgWABNarIW4tLXfeG3LYvS57uUK7JNtGm4DxQLU
         Oh8PBb0hxLUWvhgm9vF3oeKwDblUUoA3KIVcNx3yS/HhECs4o5109UGHF5FtmrjsFguG
         /yJss1gEe0NoPDNi0SvmN9B5SjW1QMOORSUKqvyY11NBlJvHofwHkIc2f/MFSCV4qQMY
         z4j64/BD3PW7KQNOY/ktDt0qjDEYt42xek+MZa63778tLoQtCX61u5Lq7GJ7a1vhb09m
         8u+g==
X-Forwarded-Encrypted: i=1; AKwUvByL8unuUPlGNyS5NVZnY/jU57fiSmbPPD9wcfzS8WO1IK8c8I6Hx3fZQI1dy/uO9/qLEkahLrTAIjJ+@vger.kernel.org
X-Gm-Message-State: APuU4Z996ZWzlHROg1/kuQK631E68E4N2aOvWtr8pvjpG/BaNuMa92TY
	QiNCDP1EwxgyH9TtMcq08tmUGdVous6CEBY4hXXC7UxM70NEoad96oh5AEAEqz3eAkLkywlGLTZ
	B/ChJZNOYkOUi0tAMFQzr93UxQhRJXZwOQFrtbmTFSH5Mvd5ntwGi8SyZexr++ocYJrlSSCXt
X-Gm-Gg: AYBFou1Q4ShQWN22oYDLS9Nhj83OVejNOJn26mHEJ2KC8nv8y7SkWlHpe0BxGSmEVB+
	kWqq64UDfDUdScplN5yZrJb2VHq0V/mjzVNXYSu3zjwJy3A2wkv5V2pBBWJpCIkfX6bs9ru66u0
	GYfFL3l88fpPW85o9XNJkjHXLoR0bWawcu8j67AsSXmCfn9F+CUnJbcZhgsuDjvNdTa84Dj1ZZF
	rWYXZp8hVz6oNUYkB3DQMFeUeu3FfCVPhttt/Iau/3bFP1cp70M/W/YWbw+tcmmnOnoDeAiwQqP
	/t/WvZdeNS1CQv0w3qZHA5S6sdx3ZZCet1Ot699En5iW9vZHcAnFyrAi0Xyl5BB4+/azYNlRwU4
	kNbQkpFzGfrIujzMZWOK7CjuOeouNAneBb1EFq+IYgspdiX4JLI/gw94/qQ5hSoq3ySM3UQ+XN8
	4=
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr8213951b3a.59.1793628246624;
        Mon, 02 Nov 2026 06:04:06 -0800 (PST)
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr8213908b3a.59.1793628246113;
        Mon, 02 Nov 2026 06:04:06 -0800 (PST)
Received: from hu-ahari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm2286942b3a.3.2026.11.02.06.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:05 -0800 (PST)
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
Subject: [PATCH 0/2] mmc: sdhci-msm: Add firmware-managed resource support
 for Nord SDCC
Date: Mon, 02 Nov 2026 19:33:40 +0530
Message-Id: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADyY6GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3eKU5OT44uTcTF3jZBPzpMREi5SkREsloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAPCZ+um0AAAA=
X-Change-ID: 20261102-sdcc_scmi-3c47baa8dba9
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae89857 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cGx-myOgvVfTzkcdCuMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: sLzPrCHTKb66O0z3MOExPqk6yrVTQeoX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX9MbeYMaQI78k
 5x/aQViJ0HAsgZhWVmukQ/qSzQ+JKmS1SLEJ0cVWreHU91DXUiWtx/NI5Fw3whrASygJUBSx87D
 EOv1KIaPbpPKyJd4tajsOSinvjy9XTo=
X-Proofpoint-ORIG-GUID: sLzPrCHTKb66O0z3MOExPqk6yrVTQeoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX5gYkwcLVfZ9e
 OZF/b8ZiAxj3DiNs8WbmBmRQFKYIY4sEq2c4V4skRMT9zkbHzfjZ+jH7LGeqlqKcpG5LLwxeRWd
 QInkMRVyuYkW/pkHACJRdOjtUZQAnHk9q+nlVm431XFQk6eQsbTMRxfoML/IW/tj0fLdbvHBcvS
 DZDaLrCSxL2xNvGQktjXynGc781GQqlko+TpYF4vhDWfEKBLQDpfjakWOnDgaRtmsJrTDsOH5d9
 rvePrO7U+2RXJEN+MrUuLjHfhSOE27H5x0WTN1Pyksa5XSmjQX39CWUX1TUHhNZso+49K7Iq7KW
 2FWvc3rYUTRdl1wX82JL2Ku7IJCOm198fXWGFygbFSlTYfrcyGh0SW7Kr/l2Q2Hb0k8Z/+JDIFe
 s43QwjlNCZb3n/FuKLT9vXXtHcWxvVeIybf7eHfQsSZUPl7TBGe1HYKCvomkb1wWZy28TzLmwqc
 8vUE8X98EnsrSnFP4yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020055

On certain Qualcomm automotive SoCs such as Nord, platform resources
including clocks, interconnect bandwidth, resets, and regulators are
owned and managed by firmware rather than directly by Linux. The
firmware abstracts these resources behind logical power domains and
exposes control through the SCMI power protocol.

This series extends the sdhci-msm driver to support this
firmware-managed model. Instead of directly programming GCC clocks and
PMIC regulators, the driver operates through two logical power domains:

  - "power": controls the SDCC rail. The driver requests power state
    transitions via pm_runtime_resume_and_get() / pm_runtime_put_sync()
    on the domain device, which are forwarded to firmware as SCMI
    power-state messages.

  - "perf": the SCMI perf domain driver dynamically registers the
    supported clock frequencies as OPPs by querying firmware at probe
    time. Clock rate selection uses dev_pm_opp_find_freq_floor() and
    dev_pm_opp_set_opp() on this domain.

Patch 1 adds the Device Tree binding for the new "qcom,nord-sdhci"
compatible string, documenting the two power-domain properties and the
absence of clock, interconnect, reset, and regulator entries.

Patch 2 introduces the firmware-managed variant in the driver. A new
sdhci_msm_fw_v5_var descriptor is added with its pd_data populated;
probe detects this and selects firmware-specific platform data and ops.
The new ops implement clock rate selection through the perf domain OPP
path and route suspend/resume through SCMI power-state transitions
rather than local clock and regulator management.

Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
---
Anjana Hari (2):
      dt-bindings: mmc: sdhci-msm: Document bindings for Nord SDCC
      mmc: sdhci-msm: Add support for firmware-managed resource platforms

 .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   |  89 +++++++++
 drivers/mmc/host/sdhci-msm.c                       | 213 ++++++++++++++++++++-
 2 files changed, 297 insertions(+), 5 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-sdcc_scmi-3c47baa8dba9

Best regards,
--  
Anjana Hari <anjana.hari@oss.qualcomm.com>

