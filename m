Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C363D5663
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533772; cv=none; b=nPhNU7laC9UBIL1GkD/XCPC+zzmzLgr7cq3Ya1kZ2g/si5xXpoL0jlRqjsWJhL7NkpbGh0hAhXDSLHUSfknEBNCfbd/5unYdPlwNsjzJ8z85EBPx4Ks42o+NptS71+8p3IDlVqcxIiAup6g9cIGQsPqhKhxWttrb8+cqDJQ/HiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533772; c=relaxed/simple;
	bh=t7qRmqHdMAl1qk4MJVpTg0mh8/vY1dTo8qJcR8916Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f46Yr1Rmq//vniESkzavLV2j7e01FTN0MZNvhpsY0KNtJPwCmqcRPXRHJHgOhXlQTc8adz9knKBlpuTJwIamFnPfPsuCCbETxpRv4s3voQlQdk8deBcj6D9XAV3Yq90kvUrTmT5EgeTG6oZOC0yzgWv4w89e1V9k3RDqoYnUzEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp/K5liQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGDC2rIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp/K5liQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGDC2rIQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H8Af1597943
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=; b=Fp/K5liQZd0BPbPo
	6C8FYm6+sKesgHm5jfJqOTCdAVQ8fmBZiCmOHKbt03g5iWpY6jVRjMGpdqczBh+x
	EGi2/VnvoVuAjx/e+EdGKmMrhrUXLhCWh1fBCfGwqEplnnDBMZOD/vqL0ygyM7t4
	/C3vlTRsN7F80iAT8QoXSGCAgRST5zWa/l9xaNGwMReTiEXTnUOeLwUAcmID9nBF
	paC6xLZuPglh9Q+A9Vj+u8j7Xs2S7f3uNrV6bl5SUl6d82UJC/Dw11vBM3ojVPfz
	izx6rMQo5dVHZSBLnz6tpMNHDavOr+cbzcgpDuaGXMja/Fn4EMSZ9A1jpnCeRhJr
	4XIAog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufse4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:16:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso375321985a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533768; x=1792138568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=BGDC2rIQY/3AZvToa+mnV+I3zJgzXJx9cd8RKeWu2ChGnrq4ksFJ50cKLhIfbY7Ksm
         JkiUQgSAq3Olk4i2ooXg1YtLbSXLwq8v4kgrxzTcNiI0z7goPIhHx2hOXsGSTTL5/3zC
         FBaeetlF7noGbKsRKOfh8CR+ofkFV3DkKFzJzkJ6B43hRLfLuMZjmNIa7N0SG9HmdVB7
         DNJx+e6gyYxN5LAjxBtlKPW3sz//VrLJYn+w2L4sZguLXxNO/e7WkFv0zlW8r3NQHIaB
         +QNuwKLaDVhOYQmh1RhztSLwB3yG7+i0EgEP2E1Fsj7k8y1TfDMUvyM4ySnYzZXf1cCg
         Coaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533768; x=1792138568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=v88xRRqUbmM827OYqEgcnOA6uMBvAzPGUdrbK2+Hl8JD7cOkGJVdnjnTHCUtwTcOTK
         PxftVcfqodggy/E4/oT9maBqG15MvusdeLNgkbtpqq+qQ5+Dv19N8HVNtxwEyWq72Vjn
         LZ9ZWOmC0Tg4BKd8du7OfBTVpiIPorX7oIDy1xASdobm+RSX+cdwQx3LsWqgXxeP2gvG
         KPmkWL+/NN+w4CQrub3LIV2mBKn2DLz7XtnkD2SL/gGnkdVRnhOdYYMQ0F7d+3PbhAvu
         pkCe4pwktfw2AlPjCTR3Z0KD96hrjHLfvm2gvxiNg23pAc7AEc1W2oziduw5saZAkTZp
         mQEw==
X-Forwarded-Encrypted: i=1; AKwUvBxvxsX8QdUilj2Sr043k+O0j4EmRsXZaEKK7NWGLRtz7nf8sXcM3V2rWBjvbqkYYIYqfJhj8MNZqCyv@vger.kernel.org
X-Gm-Message-State: AFuF++nYYN/J6X003/ryTbgvXhEZpnp6NR3stGGZ+4VyZaGLHsUpNZZh
	5BG8cHR66VyGIbfrjJEeT5XmTfZJkS4qIBXFkrZTEAonODrVhHnNVKCYsLEafd0w0snHI3mGwyA
	AcpcNBKA/yilK7TWrAzLn8blKuzWplAKzEB+mwR1rvpqFk6L53p4hGnOwFHDg9FMa
X-Gm-Gg: AYBFou1aHwVRZ28qzEKQpzJrvFklYU6FhXYm6Atg6xq+dhEPvg7DfMQe6Kd8gAPl7Gu
	ykR3RTLtXQ8hr/h1KP7tpKL6GqRWRDvrhse2tMrwn/rZKnQE/wby4yd0po9vot7l4nxc5BFZ4ek
	cryepW0cZODKD0ZG/17i80mPv8Py1lJSX4Z9FUR04zKfh3jeYkjMo39A4OfXkdKd1hTk59XC2m3
	dXD4J3A4frhtRPxOWvfZX1YGbKS800QHhuqcwveGqB/3qSuJA8chetTxZP16fgcxtw3RsiBNHoY
	9IiBlzEO+3eAGnbLAsjypu/8aIdUBBlMrEEds9NjWLLxJJK215h6vDtIn9fr4sk3rpKTR4lwbBN
	cu3nwWOjL3cQ2gPetHxBtyVbON24=
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213375685a.27.1791533767729;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213371585a.27.1791533767082;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm69068565e9.8.2026.10.09.01.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:16:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Subject: Re: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Date: Fri,  9 Oct 2026 11:15:59 +0300
Message-ID: <179153373231.1996373.14178239298073465630.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8a2c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SBSG_3fblaHcu9w4dFsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX6rnEfCSV23Dg
 pGYWnR+/4N72E8b1PrJM25NZCdmNBswLc3Rcb5clS0EiVBVNSEOr8nTKSsnav4mt1AQgT1qWtgC
 A2B8ucs8QuJ6CCRzoPRIWSX3tYeDAx4=
X-Proofpoint-GUID: 3q1vF1al-8dHp_RTR7jem3L7Fo4LmQXE
X-Proofpoint-ORIG-GUID: 3q1vF1al-8dHp_RTR7jem3L7Fo4LmQXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXxxRBH5Vxw1jk
 Fg+85EHWGTv2FLSyW55YQmwBXNW4XRzN8k3cOXsxxbwFCZ5ZKrynJtBEbvSukZWtKJlkszfuAl8
 PSWmCfPgHicSa3zhS6k/MFCp2Yvue+MUfCmXELxrPfcLElWeJqPTYjIYTYkq7DPZiDtca92oJeQ
 1bokxm2gFAvzd+1eXIfFkSHZgV2iuZtKnXMjMq5bBA1j+o+xP7d2eNyMFJFGmKUt4YTb8GavBrw
 irq2Tvj6Tdw0MbuZ7Wr1251dQLHMIJbju7NVxRiEI1P93QejvhKyTeyxjRxKpKJBpJr94c3949t
 70RU06GE+0eGj9Ufpvp5XNYLNwH6Itrfhgyop0UR8d90So+DcRlifFrYHt1yS5L2K9FeKPGdWJX
 dI0/uGF289B8AzMCFi17ml5YPrArP1mN1iJ6ECAjtq7ZqIYVe9jrY+jcT83HbzRsbKin+03gKSZ
 KwpN7b3qnH3JK4RMA9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032


On Thu, 10 Sep 2026 17:19:06 +0200, Frieder Schrempf wrote:
> Add the 350 MHz frequency support that can be used for display with
> pixelclk of 50 MHz. The divider of 7 is important for LVDS output on
> i.MX93. It is also usable for parallel output.

Applied, thanks!

[1/2] clk: imx: fracn-gppll: Add 350 MHz support
      commit: f85b551c519ee8f92be601ccf4f7d440582ac476

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
