Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D2344D83
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811302; cv=none; b=dolfusUAu65PqrVgZYY4k3EJFvV7He8W/1kxh41nwDW0pv1q7YziLxWAFxT85LwtD2JfmbG4IOOZyq9Ad2Z+doOBXPveaSctSx87CTciopkymPmQJQVw0I1yNetCbPU4R8z1dJQ+03sMucOmHWdr5OLvcvPVR8DbDyKUYo84JQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811302; c=relaxed/simple;
	bh=fH3LzlK0G+6cdVw1UBUL8BjAzugIuxnjoK/VeZpGwFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YktHZK3HMoKzYjlZr4JKH9ARewt8bTRybPFdlPjQm4cnwqId1ol4ROvFVKv3S3pXkAVTyXkrnQv0QXoDXKNYLP4LM+5hSbVjt5409swod2jRfe6zuedkZqEJpbjsC4prTllazTYnA7gyeSwSIlzhTNA8MIkv4Z6CpDiWJWSIE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeY1ceSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c22qkA8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeY1ceSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c22qkA8U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0dIk2679968
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gg2xEwxVLLgp8a6YohmCiiIF
	Vna8WCqyVDg5jFOpISE=; b=LeY1ceSLMRzrbGK0i7Z7mPYEYYJBA52eYbFUqHZ5
	lH4tuVs2C8RAmfmDdQCryHjM3W/3FncLC273SoU8DcSq5155BH80/fj/2ufG9nsQ
	SIP0qc9rZb+lNTgRFh17mdoX2xQQN+dyfa9JYhUtG31tDRCIBkA6nhqrehadIJnR
	mq5QwG0vE+eFzkB11XbF6Fh6lGR5emeefKwbKXdUwZKSDc+7A+bnrWKQuW+ju64K
	fS7XhqVWqLXk3W77TvjlYt9O/XFM32F3cK2qcdl3ZaU2HGyD/miw9l2nCqhUryZR
	K7e0WmpJdmYnXBhUrzGWSlJwQ7Fk0yV9Van44js0aRv7iQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1t3ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:21:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3592749a017so1549685eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811299; x=1792416099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gg2xEwxVLLgp8a6YohmCiiIFVna8WCqyVDg5jFOpISE=;
        b=c22qkA8U3K8E4pLHhe7IqhGqt5ugQ1P+zKWEWW2iZS6mD6KzmfWohpCro/S6j1LZ6u
         PqeFkhlHgF0o00Dxe+D7dnG2phPmc/ar8W5T3yDQe7S2VKEg838ySysvtE5zjfhPA1WO
         U6GrCpDgCPsZzf7Nq9TyQnS9QtPd665/Zx8PuH6FjkyTgcR0umnObLHrKaOfz/jmCRE+
         VGWECNPZxCXUT+oyGyhu3YCaWh5/HFa9c+rLLS+FCMfvEhWKJigMgq4G+yErYKmrqxKg
         cHhDCnNg0mDI766qoKqLEOX/88dd0mxw/ndVXSrpIe9k1qSMXhyfUJgKuWkgsupIEZga
         syBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811299; x=1792416099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg2xEwxVLLgp8a6YohmCiiIFVna8WCqyVDg5jFOpISE=;
        b=siuqaz4WXMvj4T+X27Wc72TokbNTwD21FwGsgQLpT2k2vtLhR7alJ1NRjP3aAu4vKm
         KzgdErHsXhlkvn92ToVEEuUqIIH4PPrkL+Jfwo1ClvDy+5RlYP+u9y9cJk84xstPo8pZ
         SnuLeY/j6BDkPMiLOheIeR1cVycru9WAHc/p/p4h9/LtukQjbQsj6UD41Rmmw7SIqU9F
         dUyubKfRX4+KEDNw+qnl/DFji5hzKPWFJaop+H5glekFrb85qex7zL6M5EsOIyyROmTg
         7dKtXr6LcH97gakTQIajPWPTMp/7JxABdLpq1CxKjkaTzchAmfxoXyvu2ksH2Ox+YbFq
         GcLg==
X-Forwarded-Encrypted: i=1; AKwUvBx8fjOjXMtrNpOWqeWjszdEbXN+knd+YMgWolJOv/M1DVZt2Qd35Zm8eYDfXX04+T7l6UtCL/cfIEi4@vger.kernel.org
X-Gm-Message-State: AFq9FYJIDY5iTOEh/edDhZDWmEcqsmZUu5kC8rAwg30gmoA91zQAFTgK
	ttM3s9QtfhMcsnbKVijGu7epcyRHgPQ9tpofQKwnhTuJe+vmnpgUejGlzwmszHhD57chbfb/2Ly
	toaeyuXaZOJlLqKbqfoyG+6xmX7HnU5ec3nfhrv3FNmE5mO6jyVkdTPfbkquasmxL
X-Gm-Gg: AYBFou31zpilukNzQCJ0N0gSlGErXF5w/EVL876PSOAhkufGYoDlN67EqSAwFpcFSvF
	cKlydMvUmkO6kKUYVpvzSW77h4UBTUkj4bugULRg4tuXRCqf0SEFC/EVUAyJkZymCw+TmmshDF8
	KtZEpSoBxvnVXBdCZYcTlCB43nDVcTsLXwKlhGmbJJu1U9do26emkLapf0aI5aLQggCBkYp/G3c
	dbqXa8eE0e6uuTIkpaQHE+6GA2Ocs7j6F4w9J8ByTxmGen9ZEOkmgQq8l2umcdV5jxTFQ3wlBiy
	JFc/KydaryhB7XOlmcp9UdOxKBdbttkm8AbrGlafQ/IV/hIMgDiaNi2XymCqWtqIxeyq2nZ92CV
	HzT2U84XiF6uTmRqz0Y1p0LNhtkFBJkbXelQmlwETkg==
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr14144253c88.12.1791811298545;
        Mon, 12 Oct 2026 06:21:38 -0700 (PDT)
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr14144192c88.12.1791811297876;
        Mon, 12 Oct 2026 06:21:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm19151010eec.4.2026.10.12.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:21:32 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:21:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] drm/msm: Support for GPU in Nord
Message-ID: <asze0jREeXmrItcs@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <assuimpZe3J5E2rs@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <assuimpZe3J5E2rs@QCOM-aGQu4IUr3Y>
X-Proofpoint-ORIG-GUID: FoTbwC6A6eKGLVgBsX40zHgwKssGW7pI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX0zDdFcglvLb6
 iVK4UL9m9ypGoNroCsMjXxNokXdhjF7bVADyvBgU2OfzAgVCSPWbcJhyHw3HaPeNrns6jx3lRYd
 giG0zQimqQMe7/yJVE4l+MaNII4Aj3Q=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accdee3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VSReoY4tmV1E6dsv7MgA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FoTbwC6A6eKGLVgBsX40zHgwKssGW7pI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXxOQO+ZlpZ7Fe
 CZ1xFL/GqwbXe//aA0llIQnyW4813cjIPCKZJPOiAwnLega34JyXBDZ1UDbFyNU3uIsfdGlRdEU
 MZvnMg25LWNUSUbFEHQ3JfxosDcTF74xkASWG+tCTeHpSmKsprsWh9zP6oHpJWznxkTYsOPfmED
 BohPwppaM53XmXjhFr4VYHW22IExuNnqcPyXa5kiME+5o1U24sKpM8U16QqeAvUsp7PiWmayLkI
 3fxfaOfzTZ92ZRGLufp9ALMhepMnit54HbQrzF8vwR/Pj6IbsHo8oMgJG9jBXvGz/Hh/vCk9TjG
 v9K7UgAnO9d5LNgxMyjJnbte47dnLDTzj04lMSSzU151HCxs3SDgaU1v9D2bAQRU3suZoy1I3CR
 hOCcnGmVRcfYFNldcpfPpC660rP5l1dGHrGrHz/bCsOcHxcJI2x76cNwUahiLNczyjDysL04t2W
 YJw2L7aoUjXtc5Mx/uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120053

On Sun, Oct 11, 2026 at 02:36:58PM +0800, Shawn Guo wrote:
> On Fri, Oct 09, 2026 at 02:36:34AM +0530, Akhil P Oommen wrote:
> > Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
> > an Adreno 753 GPU which is very similar to the existing A750 (SM8650
> > chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
> > This series adds support for the A753 GPU. A735 support will come later
> > in a separate series.
> > 
> > The driver and dt-bindings patches are for Rob Clark and the devicetree
> > bits are for Bjorn to pick up.
> > 
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> > Aastha Pandey (1):
> >       arm64: dts: qcom: nord: Add GPU cooling
> > 
> > Shivam Rawat (4):
> >       drm/msm/a6xx: Add Adreno 753 support
> >       dt-bindings: display/msm: Document Adreno 753 GPU/GMU
> >       arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU nodes
> >       arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU
> 
> I tested it on RRD board (against next-20261009). While kmscube seems
> running fine, I saw the following errors.
> 
> root@qcom-armv8a:~# kmscube
> [   30.192468] adreno 3d00000.gpu: [drm:adreno_zap_shader_load [msm]] *ERROR* Unable to authorize the image
> [   30.192503] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -22
> [   30.202644] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0

Turns out to be an issue on hypervisor. With an updated hypvm.mbn, the
issue is gone.

Shawn
