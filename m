Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B233DAAD2
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921939; cv=none; b=nJ/04yIzwuCnPgQKt0Z210AAtmX09g40gRec045BdBoUP+oqkGuC75PIrBXyk/IeTtrVecqeHCT6JtbRQkK99u5N456jjjgkVauIXhzxa87M3b5usbD6oVHG8j69NRqKxshW+iqPibGjsRAYR0TfjVV4VSM3vTtgfYqSk5QqgcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921939; c=relaxed/simple;
	bh=G2Z7Pl30O8a9WgZpu0SfteD0wx01E7PMOde+WFd2dPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKV0O7EmEmWEhlikk/g1cASNWSmgZM5udfU10dWAjh/+G9oCbQpPTWJ4odEaeMGS6OLTGCJXuyNJT71O40wBv8tRE7X7PBzMG0X5ECdCZXUi8jmxaAA/x9PRjeVmrPBZzsOKwOBSVxr/yECqjPcaZw3h/XSv/qaivMCkeiK7ORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXYuCktZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4ucZ2EO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXYuCktZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4ucZ2EO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7nFN3306719
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WyDOHLmH9TdkCp4AIWK93xII
	fip+SHSs1kuogHCZL3Y=; b=aXYuCktZKcZr/CgH6c0K7Z22/zVzy1Nw4dET9U/j
	++tq4s/+Ty+QQDh7Nimh8jZCrmkp1mKHLJBWHez9RCD+Rhio/HESFZYnjOC1tvC+
	W3rmEvTpMdlDiabrGMyFEpWcEBeEP/JKWV/DhpTmBN5bMsL/zBiAJ8iSV9IHZCFY
	GroAZMl7YCUIjqbM0TgC0rE6D1XPYnjQaVH0mHf7xPGTjfbLEyZBrytHVZuOrqVU
	XL8SU7rb+7TJqlM9qq2qdt4jKaA/MJw0DWZaFmNc+/7fRNIMzCg1O/YAXtEieYnM
	TIBTX9ce41RN65Gi2QPcPL/r4Os2zR9Nv0m+LKplG6yWpQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9nt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:58:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ef04756caso11370591cf.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921935; x=1788526735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyDOHLmH9TdkCp4AIWK93xIIfip+SHSs1kuogHCZL3Y=;
        b=a4ucZ2EOaws2rQnVXCYFYXCA87m6rhcZof2fyYaJIXCe4OKoVzffzI7aM56DUmkkBo
         u/OqLubeOhPL64ZvLYzRHOsxJhwJ+qtvqhXGEX9SD/7BGcW+fjeNCzvGcP+ypmU6OgP9
         FDuO/k26Gu7YkPBa+zA9z9QPFAJZkZVXoGBH9D2Cp29HY3CkNDCykgBjkuP7/CGRYVYg
         44UKUE+6MSHEY3bd5xXT7YW43Jngqyt3QsJ46YNe/QyH6Id3/iymMv9wsmc9CYBTR5UD
         a+u+zI757hUSeAcLaos7QutOL2HiPPx8B3id0sbUnLMeF2TBJmaUmFDMOoSr6qwbzqft
         HkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921935; x=1788526735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyDOHLmH9TdkCp4AIWK93xIIfip+SHSs1kuogHCZL3Y=;
        b=Zq8DxBCisKEA00yAmcZLqSNgrpyvtURNFJZuVsP7nm+z59/0BzQ8e8tBPYQ5bEGgKD
         DonQ1ezkOeims0uHa+Uk++0fUDu7egW0YKkkgI9kfKQU9cwo8VidKO055G0AntmaCL1Q
         RmdgKXvo+p6VRjEql0oKYhiWjvuLaiYl0YoWbbq9n3Occd6V71cCCIFJ4fpcCZwjh0IK
         Tb8zfzcmUGhFrmKg61oj/pmfgD2oJtmdlOsRcHHjNi+QlBP9iXYrmrn/std/+72lSsc0
         iZsttLGaIhkvbyp50hQLGb9T5Ra6AJpjvc737ve5JDt2gJuKjYXLCTPmsK8zGAC/0B+b
         TZeA==
X-Forwarded-Encrypted: i=1; AHgh+RpfrqousciuxuRQlfxdVJQ9wzlROSV9Bv6myn+64dM2Ocrf8hvwqmj46V/VmqzWp0rxRrJisx2xlYwT@vger.kernel.org
X-Gm-Message-State: AFuF++mB49D5uhtVAIvQfG0TOC/4/rQktSEceN9XcJD/EPyHLOnhQx/r
	t5bMzAbkl4o/uHetXYbyX3z8psOCofN7T3bVfDasXoKyemDu7+gF5DsLh2UX1wG1lAnxraFsFX5
	943X/3geGYRNJL4mZhQTL7x1fss1SkwdfgIJIVqQhQdkj8r8CnDyPDsJVkaKk8mQf
X-Gm-Gg: AR+sD11QGYcNp7+ts6iE6ujqYjZPc7C0Is0tmX3GpOyN+Mma7U32ggXjn7k1DT50f5C
	WkKRAk5SfBo+cTuUmVDKmfDJZO6O/V0NJQ931DSmRG7TVoBVrsGlzomtzdDY8LMo8k25gEVy2/o
	wygA020VsYkesKeVx0dJTN+M/eP/xassenyFrmIPx/pNBX7Pc+gPlLp4900Kx/BN1YHQxBp7JHY
	wAmLmEB2ECfiCGhRa36S+pF1a37SsbmyBItzZxtVgl899L3FgOqimVZZ13NJNRzjFfgsjOvjwRL
	vQuEHI7/AtaLNMjrJyCbHEN/wjx1dXgyONcYCiJv736yT9jrYquyPIchmOxx7kSuKeEl0Cz8Q4D
	e6CeoNeb1YEGX
X-Received: by 2002:a05:622a:4d4f:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52fb94eae2fmr78993211cf.27.1787921935009;
        Fri, 28 Aug 2026 05:58:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4f:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-52fb94eae2fmr78992641cf.27.1787921934474;
        Fri, 28 Aug 2026 05:58:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm68793065e9.12.2026.08.28.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:58:53 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:58:51 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] arm64: dts: qcom: Disable Inline Crypto Engine by
 default accross all SoCs
Message-ID: <rlksikmxsafrzapygzvyfvkakdlo577tlc2xklfrwhgn4rw4ya@lz77qfenxh2o>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
 <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: b9SIZ1O-WcJtvoJ32lf1AKXUqdh5d2u2
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a918610 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_snk1F1AbaDFKl-hb88A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: b9SIZ1O-WcJtvoJ32lf1AKXUqdh5d2u2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfX6pTqTFj1Y1WQ
 6aZrB9tkXi3OyuRKugiWwYMqZ3Uj6RdyEfAXJ0ondueNH53h+ST4/PiGmiTpSdFRVLLyYlNAKk/
 M+WvrH3NsOc+5CoZDBiMMLQ8W0HoTQE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfXz/io+fQpKeHT
 krLx41Jw5u0l6EepwiImmerar5+Yqu3y8J7dwnjGeWiOU7WvD9hm+4tcs5DxEwMseYK9Izfgtl3
 PgFRa07TW1MRwy5He+oHItz7ZHP2RTh5H7HiASRHwGkFnUPIRu/fwCkVeZ/jT1M8HINF2aF2ZY+
 JMsYU2131MMDx8cD7c1pwPv0hPOdiIurghOCFp69e7LqBg7foYfNwHspm2pIexuAN7jNPQuuGfk
 rxCMFBI2zUFHeAI/ojOuD1ZUxAL1uJQuSiTM/HSD9XQK2QS2a2C4GV6e4xZK4LoRCAqs6p4yjAO
 SFZqwRcKo9Pg+2r3koipZ40S6aOYW+Y2ETWAvRIQn/3WOtxLBKXi0Faor0n9juy0tQgPCf7A0Op
 nF8pRYCnR/aR0g0RKt3z4qxdbXeAlsymUd+nZs/ZdJEPPg2fiuEkmiIdXlVifz/7JZetH2M8FNi
 8QYktBwWN355iCdgvHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280112

On 26-08-28 18:17:52, Kuldeep Singh wrote:
> 
> 
> On 28-08-2026 18:07, Abel Vesa wrote:
> > Since UFS_PHY_GDSC was attached to the Inline Crypto Engine and the driver
> > does not currently do runtime PM, the GDSC remains enabled while the
> > device is idle, even on boards where there are no consumers.
> > 
> > I'm working on getting runtime PM enabled in the ICE driver, but the
> > node should not be enabled on such boards anyways.
> > 
> > So disable the Inline Crypto Engine by default in the SoC DTSI and enable
> > it only in board DTS files that use it.
> > 
> > Do this accross the board, for all SoCs that have dedicated ICE DT node.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Kindly check discussion happenend before on adding such implementation.
> 
> https://lore.kernel.org/all/56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com/
> 
> The idea is to enable ice as default and independent of storage media
> and enable runtime PM enabled.

Yeah, just replied to that thread right now.
