Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447403;
	b=gpod8KbKOxlK6HQaeyNYAdJN+u1NV3cghJ9bQ+C9weEkbY352nv3gdiRUS0Rb28gOH2u
	 bew7jAOZZ2iIZgffXBd20fdm5mkZQv85EsmyL4/tu16GT4O1h8bSIpvvX5GSoWUn9Je2I
	 32IeuPCEOE8xwkWwdAGBwGCNSo4WjSHfQMiHKbOPlutY8O7cPvaUPOdrqnHhItyzgqWJs
	 xwiFqX+i5h87x6/TkfwB5o142vD0gXOQzkzBMd5TGHm3CIutTeBLzvo8gms+WIQC3ctdn
	 XzNN1SWVp/w/8xbZgii9Vd66OuNnc3bPst5dOFW6LlKVmE+FHFJ7q4dyM8jOnb2NG4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=;
	b=pyyz3s7nda5jUGTd+KaS29CmxcVppjThppB6g+xk36ENwL6QX8znRiDtOzrvbT3FGJVy
	 a9bIN7rZaJdlnotw3IuB3b8rHanxG2ftqBd7wbr7NbkVpBcd/YL8WaFUGFDsh8qXIHTKl
	 OtyA2dHDt3AIC4zN6yT8SY+Ij/hg25y5Xke5IHSbC4HhOrOS82cWurStuHUOC2tdBxBMB
	 hR2EI0zKlG56QnkQOXn0DJr1TY6byWveWGtJj+jzHQShrg9DFp//3/VJPW0OIHIF6L03H
	 JiMGALK/WiMzIMzNKB2HiZ0+CvfHp7Lo+CcdFSyr5Rs+MIm31wL+17Eigs3noKP8NYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XAwhOH09;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJ5e9WDU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF3606A339
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFF3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XAwhOH09;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJ5e9WDU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKtGh3329294
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=; b=XAwhOH09cSmZIyMZ
	61SRbvucln4yT5LQR43vwwtqrg6gGUS9OmtV8TkI5NEXkzZ6XQ+aWc6UrT9959jT
	/p2mtQs9rzMgULMUzgs1J3Ky1mD8SjzsEXjSYCZkkpg54W+1dqkicupzXFScFHKV
	378KhdbXjJ3WyA02Z7JKHyyOb9ILPGKHiCmH6y+aHyEghPObUkY05P1hLcTOzEbK
	4rejhDHzbNrQ2xMYOKKDDFiZ4ClrVRZyBi3xcccpDG93Flbmn6FoKTKChPcjcr3a
	pjCWu17C69iKDJecE3z+bMH7BFTHAtHA5zumGQfOolHgWdQIhmRhpSbYk8vUhS2G
	NNzfJQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd22cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so166774137.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447401; x=1796052201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=;
        b=FJ5e9WDUFovDDsHKUhfVgJ8bwoMgKgj7CPVmypMye/O5vfOcpdoiX/My7eToFpl18X
         DW2E4AbdEhRG5UlLvcFT/ODFKTgGiEQLnW1AZh10b9ERQzmTfBE7gO5VJW++iG5QtuKl
         9uXU46tbHGrZG9ChaAmzrY+mvZPYdw0+QEjXIFhzQWBH7InrDxzHJpkxmLghux79SxkN
         3u6KhHOKZjMk1nE3FY+l1zrJeciMZ1bTgF9wb5zdIb2LPCS0di0RBxJJ+vjFA3bj1y3Z
         ejsVyxPDD74u8wxeiyFPXpRKp+lDnfn/hsCcSJxYEbIyseef2OL+Yq1uGpcDPqb6l8vS
         /pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447401; x=1796052201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=;
        b=pMDeqZNEhHEZ1NtfHkHKuDuEfynheBXErxIrvmqK1KuZfFVhLJboqpVn+LUFc8w9I2
         o17VW6zea/nY+7uPrLgJys1KYd/YD1+lP01vJskKsXQp35V2vThNi76UxGziuQwS4R7H
         6c2L+SyjrTw1Julv032NrAn+tMChCwgCZAJ3dGC174uwx/UnkLwew8RhXn8nyQm1RKIX
         7VTv2IHpCAuEHn8mwGQvQYUeR3tYWFu21Xslw4/8ohsGmT9BHYPjFsCLFMna4xd4HXrk
         drepHQ1yWLqQEQ/g1AngLnc1HTBxjccHClxb3kPUaFYkWT1KLUEK2aqCY7jC8oYk2my5
         GUXQ==
X-Forwarded-Encrypted: i=1; AL+hErEMRVVpMvFHro0xYB9eNhYuoe8MHjWxV6odC2TXt2qKCIDsmCa35NUfWnuGfUMNw0xK5pgv1jiPeS8I@vger.kernel.org
X-Gm-Message-State: APuU4Z93Z7AbV9/AyYYW8Osv7qBP9aN7oyy8Z66F4GOLIKzrUsX75ERT
	dROZe+e40aGRmvSKnX6KM8DC8+aopgRW4AyyU71V5JA+xi7MaSn86N/sVnP99qQe6AmPQdzVLUo
	3Jda66Ym+LiW+YL9NweSicgWqEXeRbwomSmVdU31DFuXgoJSkIqq+Aji/dqoH2UEM
X-Gm-Gg: AZFdTZdFuhakYkjGpVXPFjbpsnQLnKlFneMI5ieLypDCcs4xUKAH9tp+PgztRagUlzW
	mb2SrNbQIcuRcbLXIl5SHzn3SDH/HiZB85HsUBwlIbzR0huQbb62xVZXLCsVntxGEQbr3mXBRLP
	3raqvsAOrHQV0XU5LwEpidtTFK9JgfjGfxqJAnjITd2L5hjIJnDx1jhWlAyvcXK/QbHk7YmM0zn
	ZbQr9fTgHdX2WhzdZRdqzjncn6f2lo5jNgX2taBHFEFICFHWOH8ehT/umIMXwu4ZW/gnc4uqBkD
	dae4fHLfacoQFhMfGR01D9CUIzR0E3U0Qss0S+okJt9oNrs7a0IUU3tXWmIMffrblsAFMpCEC6F
	jHgW8RnMrdqhPXVBS9Bv+LhhZLpu7wxN22GRc5msZh7rWDweBNyMAeDR0QMr9O2m7PosemVM=
X-Received: by 2002:a05:6122:2bcc:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ee8af63b72mr7094698e0c.4.1795447400872;
        Mon, 23 Nov 2026 07:23:20 -0800 (PST)
X-Received: by 2002:a05:6122:2bcc:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ee8af63b72mr7094655e0c.4.1795447400353;
        Mon, 23 Nov 2026 07:23:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:19 -0800 (PST)
Message-ID: <57c90ea4-5521-484a-b829-e763fcf73cd8@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:17 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: agatti: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ybufvKyUm-gmy2L7ElSUVi88wJD4oBVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX2mENvS0DcNxe
 NCexFiliCA6Qbtknahird62B0KY2K2i7pwoVtyQPtSCsYNXiLw8i2Dp4e1WXPgdGgxcR5OFIYhH
 kq6Fu4IKjpeSkKYhaj66MBRNZ0DVIk3qTIHCZzZsMNGSLGyf6cHmhsSyWadrzuwCgSZWRoZ/wcp
 4F/xsD6JA6lWYj/odcu1rm0kJBkxiK+ML1JFHSrg464ZyWC24RX10fYTK7mSfk2j7E5Iy28vVnH
 QS4NSQvuNZ8Y1HOofcmRSAg2eMFDN5pRuSWbo/3jclf13Wf1mEO7TPq17nt/WZ3yW7QsOL+FQZi
 XgWI3PkUqu2YnWScEfG8fPIGIyzl1pZJXMOgUausa+c1Cnb1mWKM/MswK8FAnWnrnQMm0VorAqQ
 126eT0aqH7UxnRFnvCB4v09TJfVC8rJXpWe/hgobjcautCv9L6M6gIWOOgGMO6Ag0/tl8IzOmR9
 wIlO6TueG90cau9xHIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX9TDgGgGYRZwv
 LmQxxi7lfnnpNbLvJUBHKYjUgMUPcg5QC2464YYleLVaI/ZXXpHvrMPgQ+aTkhkG+6uIjvTecsf
 n8cQnlXvAboYzExQuyHlNFpJJ4ED7PA=
X-Proofpoint-GUID: ybufvKyUm-gmy2L7ElSUVi88wJD4oBVN
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045a6a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=948W2wBnRhwx5lWVa8gA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: e3f6a6994041 ("arm64: dts: qcom: qcm2290: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
