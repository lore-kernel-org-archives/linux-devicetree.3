Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602413EF66B
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562263; cv=none; b=YCoGrHP6F9szB9aU1D0yL2Qws0qCogbs69O0fyNngCPHsr2f6stPrJe0vttMvPDCNvP6s1U+29mZ5kuzMAF7oHIcHFO3y99cnQYYr4g6mgL7CcbKM2BHwxOGm7Pp/S3aLu60KUEt9jEblA/jOoZTAzNptwHIc0sWXsbVmK4iMCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562263; c=relaxed/simple;
	bh=7GtKT0ZmVger2XBJrLywvuYtDWmOa4M9hkNkuOLg7fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzoi/H4829h6BXzYR7bxHxLo9Dq/mpOTHtwx9QeU+YdOIKHlSwZ7bpqGN8sQ/BFajgJlArUiwPVhJTGlDv6jdbTplj38shq7ZYNqa8UD1ObOqrSiiDTBYZraxBfPkotJ79hYKgrXA5jpDmerHSVij5igeuINiM8qsegtPOttdr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUYn09hO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9nK/rwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUYn09hO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9nK/rwx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7BgeS1815879
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I5iXFVs0UWlY/4RpvmnF6UxK
	I60QKsGEgwBkwUkWY2o=; b=jUYn09hOOHBPOcKUjjfNmtyHoA2FSeKtA9qF5dd6
	Cfjzz1hi355PwFBlnxaFLT041s03xZ6dd3S1CbU7mdqNY+SdbGftwpEGE8XfmA9z
	CPwXWX77lifIJCMRTI9uAhVtJ3D2mYwxcFZGcFXnzSHIAc6xpHDyql2smqdjIj1B
	yYL8KRtEDV49gtvnY81BuxByir7QsSc6UrhVPX2en7wQjPtGDz5s8vGrrJ74AkVH
	s3cRdsHd1Ss8FXGeV8XO0eeJo95yL7JMTVr/8sgjDbp72mc5x5M2Rt0v59gxvoz2
	JjONkRYxdomnAU/7kaRv0OeUVhxCvH8VD1MCFBpKhg+CdA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtgf34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:04:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73858d44c8aso799683137.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562259; x=1788167059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5iXFVs0UWlY/4RpvmnF6UxKI60QKsGEgwBkwUkWY2o=;
        b=f9nK/rwxb1YkgWNTv6w2umUYKdT3TYeHnFvfSvR8QjTav4O52OT26sHyrXZKYF//67
         eiO3fFCX+FJPcbvuDNFFxqJM/zLZHBhoA2wZecUzVFInIIGW7H8+va6ENbipTonADp/N
         i98FyjGjK/drM/q1n0dIOBBSZDMgTSMq5qTZn8AnybrQ4v53brcYDl0TTfmvWW8D6ik2
         +2uZGlORo1GadVK2S131KTynVV3rXTXLFt43Zbl/Lt5PjWg8MlpTkX/d3XapZN3rcpBj
         rQVJtDfKxSPwJNa+iiixMP+TZRlVGO+ZpwolcBijSOEIJZYyM3LpAz9qYttqsqIMh1xK
         z45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562259; x=1788167059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5iXFVs0UWlY/4RpvmnF6UxKI60QKsGEgwBkwUkWY2o=;
        b=qS2ggaUqdaxN1tAl0f0sUntahd0ujj2gZkmgPjkYn5IFVQYxVsMxHV2xm/piuItJrx
         Y+chDrTYLdlMmUZSBzLLR6iZP2ggdaEwRV2vPRH8WtV+xKax6InndN/RbrgJ3u7y2PRw
         HDCd0Czmj5F0hYLgmo/3wGdkC6NpKgqXRURodSt6dpl9pNcJyHuDLLYPqRm5PlvoLrRS
         7N5Mcy3BpQgR1J29lx/53cYZMOg/V8tQkyB8l7HhBESIDzg6eoXnBGr6zvAvgWSiDZ8r
         0xGoxLvdPISNS36EQFOMaEKGO4LLh9+HqavpIyyGTQCQpCov7pJ10OwyfgIyM4uy/dje
         LSjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcGtltrEgIzLk/tuuqkwVhMxGOXzN9t3NM0SMNWXSd4gE2tnQW5l8tquqEL638DTkXAkqQ4ccEs/Vd@vger.kernel.org
X-Gm-Message-State: AFuF++lf4LS1a+1BIkBouHy98Y/VGMo3PXMJp6mYT0Ll18pK6GquuYP8
	SI5H3AjkrDnMCcNaKsS78iNCMCOb9uvAP04DuFXtvxa87NM+PmEJ3zmZ8vT4owaihkw/cczsG6S
	fxDKi6OBiL+1+T6/bdUE7iCc747JJqOq0Ibz3IuMSJmb/RCsc5QkCUz766cRA41vF
X-Gm-Gg: AR+sD13swAXRaNAfFeP2hoZhhMM8vukmRocg0vlEs43JbobHUOUJugHBs/lEhTWTPBS
	95dVE0Cy3EPkdm09pHAV/Y/0x7L7sguFfp5doEzXniQuewwCYek0fTpxCl2AdKP47fqqnwhBwMU
	Guair+HhVZz10nlkfW8aEkSnhSdpfWVVPB9bg33X0hpsWbyOuGZ67ziGqcyEkF2wDDc6xV/MBBP
	Ug8vLGPZQhQO7sCg5gHBATZZDdXx+aVBfy74kjBw/al0PjzzXMZC+K+psj5GDsxOKMIGyGbraPc
	axHG/C5EIv255A3/0r9Watt+NlhWwpyF8bSvrZXknbdIyQcPEQ1p5S0HyLsBD41IvLM6lOdK8Rd
	T+yxN03PgW+BPYog=
X-Received: by 2002:a05:6102:8092:b0:77f:2f7a:f07e with SMTP id ada2fe7eead31-77f2f7b3870mr439470137.9.1787562259418;
        Mon, 24 Aug 2026 02:04:19 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:77f:2f7a:f07e with SMTP id ada2fe7eead31-77f2f7b3870mr439431137.9.1787562258866;
        Mon, 24 Aug 2026 02:04:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e02a8fbsm10850642a12.13.2026.08.24.02.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:04:17 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:04:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <qy4dstdfwguaalr6ildd5esrskx6yxi2zga2my7m32dtx4icne@n6moblldqii5>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX1ms6uqMdxNMD
 sVQ4xd6jC1yeW9IUzBNUEt2BKW3QegZkYU/Myz+klOXBYmfM68LRbvcyvmPZ/dRth+kCOW6rv3I
 LmKlFrzNsDBdt3WHY/Z3Ekcn8DS3I4vxIaQvq1ymc221TchroPPYkeBxtM+SZPHHYS+hUiD9DXC
 hMlChysL3bMNKu0M7o9LgmmRVkdB3gDvMyU2zJp0QlZ7vL1V2l0eAQ9FMpKEtAk6vBQxD3YFPss
 J5rbBM42Nh4eUSPm63odIWaC+CWpbRnamNDic+ACG8yquSypgbLRjUHfcidVW/bFvVe3o1DCu/F
 JPg/Ui3CR5MNyxncu29zIquNK+q+gLF5ty3osttiCGb6wxBxcjJzBSyTHNA98e9UBKNbPIF/UHE
 tET4raUPPqk7FTPd63guwskek8XtNDDJ0iIN1zDDC8Ef1a+s1TSDLSERO2GKBZ2Q2ZYF5C+pciE
 cBsuF1C2XhnO0Sblk4A==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c0914 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXyNE9Fel4xFOy
 /N/4ecVU0nTRy9Z8bTAlp0k33Gz31JxFPw26S61yHQBBJ6C6rtcr6YIatcgI3QfcNIiq8rHHT6h
 fahLLOF4LI1KhMBa/JuRDsrQv38eS3A=
X-Proofpoint-GUID: 4A7QsAckQ-auhricLI02_dyM07dIhRRy
X-Proofpoint-ORIG-GUID: 4A7QsAckQ-auhricLI02_dyM07dIhRRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 26-08-17 12:10:06, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> >> The suggestion of having the CX power domain tied up to the GCC
> >> controller started here:
> >>
> >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> >>
> >> and then, for Glymur, it has been brought up here as well:
> >>
> >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> >>
> >> These plus a discussion off-list led to this patchset being done.
> >>
> > 
> > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online

I can confirm that disable GPU related nodes does allow CX to collapse.

Had a conversation with Taniya last week (off-list) about this.

I think there was a recent fix from Akhil that was supposed to fix the
GMU recovery, which will allow us to drop the pm_runtime_disable() from
gxclkctl.

Taniya ? Akhil ?
